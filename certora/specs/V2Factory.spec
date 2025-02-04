/*
 *
 * @Author : 0xJoyBoy03
 * Verification of uniswap v2 factory contract
 *
 */
import "methods/IV2Factory.spec";

use builtin rule sanity;


////////////////////////////////////////////////////////////////////////////////
////                         # Ghost & hooks                          //////////
////////////////////////////////////////////////////////////////////////////////


ghost uint ghost_allPairsLength {
    init_state axiom ghost_allPairsLength == 0;
}
ghost uint ghost_feeToSetterUpdateCount {
    init_state axiom ghost_feeToSetterUpdateCount == 0;
}
ghost uint ghost_feeToUpdateCount {
    init_state axiom ghost_feeToUpdateCount == 0;
}


hook Sstore feeToSetter address feeToSetterAddress {
    ghost_feeToSetterUpdateCount = require_uint256(ghost_feeToSetterUpdateCount + 1);
}

hook Sstore feeTo address feeToAddress {
    ghost_feeToUpdateCount = require_uint256(ghost_feeToUpdateCount + 1);
}

hook CREATE2(uint value, uint offset, uint length, bytes32 salt) address pair {
    ghost_allPairsLength = require_uint256(ghost_allPairsLength + 1);
}


////////////////////////////////////////////////////////////////////////////////
////                       # Functions & Helpers                      //////////
////////////////////////////////////////////////////////////////////////////////


function cvlInit(address token0, address token1) {
    // does not return any value
 }

function sortTokens(address tokenA, address tokenB) returns (address, address) {
    if(tokenA < tokenB) {
        return (tokenA, tokenB);
    } else {
        return (tokenB, tokenA);
    }
}


////////////////////////////////////////////////////////////////////////////////
///////                          # Invariants                         //////////
////////////////////////////////////////////////////////////////////////////////


/*
Creating pair is successful only if tokens are the same, non-zero and the pair is non-zero and didn't exist before
*/
rule integrityOfTheFactory(env e) {
    address tokenA; address tokenB; address token0; address token1;
    (token0, token1) = sortTokens(tokenA, tokenB);

    bool pairExistedBefore = getPair(token0, token1) != 0;
    address pair = createPair@withrevert(tokenA, tokenB);
    bool success = !lastReverted;
    bool isExpectedToRevert = tokenA == tokenB || token0 == 0 || pair == 0 || pairExistedBefore;
    // This is more sound than using require_uint256(allPairsLength() - 1)
    uint lastIndex = allPairsLength() > 0 ? assert_uint256(allPairsLength() - 1) : 0;

    assert !success <=> isExpectedToRevert;
    assert success  <=>  (
                            !isExpectedToRevert                &&
                            getPair(token0, token1) == pair    &&
                            getPair(token1, token0) == pair    &&
                            allPairs(lastIndex) == pair
                         );
}


/*
Each pair is unique
*/
rule eachPairUnique() {
    calldataarg args1; calldataarg args2;

    address pair1 = createPair(args1);
    // After the above call, we are sure that the args1 and args2 are different 
    // cause the factory don't allow dublicating pair and the prover rules out the reverting path
    address pair2 = createPair(args2);

    assert pair1 != pair2;
}


/*
Number of pairs are only increase
*/
rule numberOfPairsOnlyIncrease(env e, method f, calldataarg args) filtered { 
    f-> f.selector != sig:allPairs(uint).selector // avoiding vacuity
    } {
    uint allPairsLengthBefore = allPairsLength();
    require allPairsLengthBefore < max_uint256 && allPairsLengthBefore >= 0;

    f(e, args);
    
    assert allPairsLength() >= allPairsLengthBefore;
}


/*
Integrity of fee addresses with respect to the value of feeTo and feeToSetter
*/
rule integrityOfFee(env e, method f, calldataarg args) filtered {
     f -> f.selector == sig:setFeeTo(address).selector         || 
          f.selector == sig:setFeeToSetter(address).selector
} {
    require e.msg.value == 0;
    uint feeToCountBefore = ghost_feeToUpdateCount;
    uint feeToSetterCountBefore = ghost_feeToSetterUpdateCount;
    address feeToSetterAddressBefore = feeToSetter();

    f@withrevert(e, args);
    bool success = !lastReverted;

    assert lastReverted <=> e.msg.sender != feeToSetterAddressBefore;
    assert success && ghost_feeToUpdateCount > feeToCountBefore <=> f.selector == sig:setFeeTo(address).selector && e.msg.sender == feeToSetterAddressBefore;
    assert success && ghost_feeToSetterUpdateCount > feeToSetterCountBefore <=> f.selector == sig:setFeeToSetter(address).selector && e.msg.sender == feeToSetterAddressBefore;
}


/*
Integrity of changing the states with respect to the value of allPairs and feeTo and feeToSetter
*/
rule integrityOfChangingStates(env e, method f, calldataarg args) {
    uint allPairsLengthBefore = allPairsLength();
    address feeToBefore = feeTo();
    address feeToSetterBefore = feeToSetter();

    f(e, args);

    

    assert f.selector == sig:createPair(address,address).selector <=> (
                 (feeToBefore       == feeTo())                   &&
                 (feeToSetterBefore == feeToSetter())             &&
                 (allPairsLength()  != allPairsLengthBefore));       
}


/*
Number of pairs created is equal to the allPairs length
*/
invariant numberOfPairsEqualToAllPairs()
    ghost_allPairsLength == allPairsLength();


/*
Constructor updates the feeToSetter state 
    this is a high level property which catches the mutation in the constructor
*/
invariant feeToSetterUpdated()
    ghost_feeToSetterUpdateCount > 0
    {
        preserved with(env e) {
            require e.msg.sender != 0;
        }
    }


