/*
 *
 * @Author : 0xJoyBoy03
 * Verification of uniswap v2 pair contract
 *
 */

// Simply say, we dictate the Router actions , call the core functions and then do the assertions

import "methods/IV2Pair.spec";

using UniswapV2Pair    as _pool;
using DummyERC20A      as _token0;
using DummyERC20B      as _token1;
using UniswapV2Factory as _factory;
using UniswapV2Callee  as _flr;

methods {
    unresolved external in _._ => DISPATCH [
        DummyERC20A._,
        DummyERC20B._,
        UniswapV2Pair._,
        UniswapV2Factory._
    ] default HAVOC_ALL; /* Sound */

    // Dummies
    function _token0.totalSupply()                             external returns (uint256) envfree;
    function _token1.totalSupply()                             external returns (uint256) envfree;
    function _token0.balanceOf(address owner)                  external returns (uint256) envfree;
    function _token1.balanceOf(address owner)                  external returns (uint256) envfree;
    function _token0.allowance(address owner, address spender) external returns (uint256) envfree;
    function _token1.allowance(address owner, address spender) external returns (uint256) envfree;

    // UniswapV2Factory
    function _factory.feeTo()                                  external returns (address) envfree;
    function _factory.createPair(address, address)             external returns (address) envfree;

    // UniswapV2Pair
    function _safeTransfer(address token,address to,uint value) internal with (env e) => cvlTransfer(e, token, to, value);
    function _.initialize(address token0,address token1) external with (env e) => cvlInitialize(e, token0, token1) expect void; 
    function _.uniswapV2Call(address sender, uint amount0, uint amount1, bytes data) external with (env e) => cvlUniswapV2Call(e, sender, amount0, amount1, data) expect void;

}

use builtin rule sanity;


definition WAD()                     returns uint = 1000000000000000000;
definition onlyPoolMethods(method f) returns bool = f.contract == _pool;
definition balanceEqualReserve()     returns bool = _pool.reserve0 == _token0.balanceOf(_pool) &&
                                                    _pool.reserve1 == _token1.balanceOf(_pool);



////////////////////////////////////////////////////////////////////////////////
////                         # Ghost & hooks                          //////////
////////////////////////////////////////////////////////////////////////////////

// A precise summarization of sqrt
ghost floorSqrt(uint) returns uint {    
    axiom forall uint x.
                // sqrt(x)^2 <= x
                floorSqrt(x)*floorSqrt(x) <= to_mathint(x) && 
                // sqrt(x+1)^2 > x 
                (floorSqrt(x) + 1)*(floorSqrt(x) + 1) > to_mathint(x);
}

// A precise summarization of division with a range of [-1, +1]
ghost rangeDivEqual(uint, uint, uint, uint) returns bool {
    axiom forall uint y1. forall uint x1. forall uint y0. forall uint x0.
                (x1 != 0 && x0 != 0) => 
                rangeDivEqual(y1, x1, y0, x0) == (
                    abs(y1/x1 - y0/x0) <= 10
                );
}

ghost abs(mathint) returns uint {
    axiom forall int x.
                abs(x) == (x < 0 ? -x : x);
}



// A precise summarization of subtraction with overflow handling
ghost safeSub(uint, uint) returns uint {
    axiom forall uint x. forall uint y.
                safeSub(x, y) == (x >= y ? x - y : (max_uint256 + 1 - (y - x)));
}

ghost safeSub32(uint32, uint32) returns uint32 {
    axiom forall uint32 x. forall uint32 y.
                safeSub32(x, y) == (x >= y ? x - y : (max_uint32 + 1 - (y - x)));
}

ghost mathint sumBalances {
    init_state axiom sumBalances == 0;
}

hook Sstore _pool.balanceOf[KEY address a] uint newValue (uint oldValue) {
    sumBalances = sumBalances + newValue - oldValue;
}




////////////////////////////////////////////////////////////////////////////////
////                       # Functions & Helpers                      //////////
////////////////////////////////////////////////////////////////////////////////

function setup(env e) {
    require _token0 == token0();
    require _token1 == token1();
    require e.msg.sender != 0;
    require e.msg.sender != _pool;
    address zero_address = 0;
    uint256 MINIMUM_LIQUIDITY = 1000;
    // Note that the prover can't and shouldn't find a path where both of them are true
    require totalSupply() == 0 || balanceOf(zero_address) == MINIMUM_LIQUIDITY;
    require balanceOf(zero_address) + balanceOf(e.msg.sender) <= totalSupply();
}


// We refer to this function to handle some checks
// see the initIntegrity() rule
function cvlInitialize(env passedENV, address token0, address token1) {

    initialize@withrevert(passedENV, token0, token1);
    bool success = !lastReverted;
    bool resultOfSuccess = _pool.token0 == token0 && _pool.token1 == token1 && _pool.factory == _factory;

    assert lastReverted => passedENV.msg.sender != _factory;
    assert success => (resultOfSuccess && passedENV.msg.sender == _factory);
}

// Summarizing the transfer operation
function cvlTransfer(env passedENV, address token, address to, uint256 value) {
    uint reserve0; uint reserve1;
    (reserve0, reserve1, _) = getReserves();
    if(token == _token0) {
        assert value < reserve0;
    } else if(token == _token1) {
        assert value < reserve1;
    }

    // Self transfer is not rational so we avoid it
    require to != _pool;
    token.transferFrom(passedENV, _pool, to, value);
}


function addLiquidity(uint amount0Desired, uint amount1Desired) returns (uint, uint) {
    uint reserve0; uint reserve1;
    (reserve0, reserve1, _) = getReserves();
    if (reserve0 == 0 && reserve1 == 0) {
            return (amount0Desired, amount1Desired);
    } else {
        uint amount1Optimal = quote(amount0Desired, reserve0, reserve1);
        if(amount1Optimal <= amount1Desired) {
            return (amount0Desired, amount1Optimal);
        } else {
            uint amount0Optimal = quote(amount1Desired, reserve1, reserve0);
            assert amount0Optimal <= amount0Desired;
            return (amount0Optimal, amount1Desired);
        }
    }
}


function quote(uint amount0, uint reserve0, uint reserve1) returns uint {
    require reserve0 > 0;
    return assert_uint256(require_uint256(amount0 * reserve1) / reserve0);
}


function encodePrice(uint r0, uint r1) returns uint224 {
    require r0 != 0;
    return assert_uint224(r1 * 2^112 / r0);
}


// Performs Router Actions
function routerHandlerFnCall(env e, method h) {

    if(h.selector == sig:mint(address).selector) {
        uint amount0Desired; uint amount1Desired;
        uint amount0; uint amount1;
        // for avoiding rounding errors
        require amount0Desired >= WAD() && amount1Desired >= WAD();
        (amount0, amount1) = addLiquidity(amount0Desired, amount1Desired);

        uint pool0Before = _token0.balanceOf(_pool);
        uint pool1Before = _token1.balanceOf(_pool);

        _token0.transfer(e, _pool, amount0);
        _token1.transfer(e, _pool, amount1);

        // Execute it
        uint callerLiquidityBefore = balanceOf(e.msg.sender);
        uint liquidity = mint(e, e.msg.sender);

        assert _token0.balanceOf(_pool) == pool0Before + amount0;
        assert _token1.balanceOf(_pool) == pool1Before + amount1;
        // Integrity of liquidity
        assert balanceOf(e.msg.sender) == callerLiquidityBefore + liquidity;

    } else if(h.selector == sig:burn(address).selector) {
        uint pool0Before           = _token0.balanceOf(_pool);
        uint pool1Before           = _token1.balanceOf(_pool);
        uint callerLiquidityBefore = balanceOf(e.msg.sender);
        uint caller0Before         = _token0.balanceOf(e.msg.sender);
        uint caller1Before         = _token1.balanceOf(e.msg.sender);
        
        uint liquidity; 
        _pool.transfer(e, _pool, liquidity);

        // Drop it
        uint amount0; uint amount1;
        (amount0, amount1) = burn(e, e.msg.sender);

        assert _token0.balanceOf(_pool)        == pool0Before - amount0;
        assert _token1.balanceOf(_pool)        == pool1Before - amount1;
        assert _token0.balanceOf(e.msg.sender) == caller0Before + amount0;
        assert _token1.balanceOf(e.msg.sender) == caller1Before + amount1;
        // Integrity of liquidity
        assert balanceOf(e.msg.sender) == callerLiquidityBefore - liquidity;
    } else if(h.selector == sig:swap(uint,uint,address,bytes).selector) {
        uint112 r0Before; uint112 r1Before;
        (r0Before, r1Before, _) = getReserves();
        
        uint amount0Out; uint amount1Out;
        uint amount0In = getAmountIn(amount0Out, r1Before, r0Before);
        uint amount1In = getAmountIn(amount1Out, r0Before, r1Before);
        _token0.transfer(e, _pool, amount0In);
        _token1.transfer(e, _pool, amount1In);
        // Swap it up
        swap(e, amount0Out, amount1Out, e.msg.sender, 0);

    } 
    else {
        calldataarg args;
        h(e, args);
    }
} 

// Mimics the uniswapV2 library
function getAmountIn(uint amountOut, uint112 reserve0, uint112 reserve1) returns uint {
    mathint numerator = (reserve0 * amountOut * 1000);
    mathint denominator = ((reserve1 - amountOut) * 997);
    require denominator != 0;
    return require_uint256((numerator / denominator) + 1);
}


function cvlUniswapV2Call(env passedENV, address sender, uint amount0, uint amount1, bytes data) {
    // Passed env is the pool contract
    // Proving the integrity of entrant and lock() modifier
    assert _pool.unlocked == 0;

    // Makes arbitrary calls back to the v2 pair to cover all the scenarios.
    _flr.uniswapV2Call(passedENV, data);

    // uint112 r0; uint112 r1;
    // (r0, r1, _) = getReserves();
    // // We need to ensure that the contract implemented by user, repays the flash loan with fee to the pool
    // // the if statements are necessary and sound
    // if(amount0 > 0  /* token0 */) {
    //     // amountIn
    //     uint amountToRepay = getAmountIn(amount0, r1, r0);
    //     // Suppose the user did some arbs and successfully repays 
    //     _token0.transferFrom(passedENV, sender, _pool, amountToRepay);
    // }

    // if(amount1 > 0  /* token1 */) {
    //     uint amountToRepay = getAmountIn(amount1, r0, r1);
    //     _token1.transferFrom(passedENV, sender, _pool, amountToRepay);
    // }
}


////////////////////////////////////////////////////////////////////////////////
///////                           # Invariants                        //////////
////////////////////////////////////////////////////////////////////////////////


/*
For all possible scenarios of swapping tokens, reserves will increase at the end
and the balance of the recipient is updated as expected.
*/
rule integrityOfSwap(env e, bytes data) {

    setup(e);
    require data.length == 0;
    require balanceEqualReserve();

    uint112 r0Before; uint112 r1Before;
    (r0Before, r1Before, _) = getReserves();

    uint amount0Out; uint amount1Out;
    uint amount0In = getAmountIn(amount0Out, r1Before, r0Before);
    uint amount1In = getAmountIn(amount1Out, r0Before, r1Before);

    uint before0 = _token0.balanceOf(e.msg.sender);
    uint before1 = _token1.balanceOf(e.msg.sender);

    // Router Actions
    _token0.transfer(e, _pool, amount0In);
    _token1.transfer(e, _pool, amount1In);

    // Swap it up
    swap(e, amount0Out, amount1Out, e.msg.sender, data);

    uint after0 = _token0.balanceOf(e.msg.sender);
    uint after1 = _token1.balanceOf(e.msg.sender);

    uint112 r0After; uint112 r1After;
    (r0After, r1After, _) = getReserves();

    assert after0  == before0  + amount0Out - amount0In;
    assert after1  == before1  + amount1Out - amount1In;
    assert r0After == r0Before + amount0In  - amount0Out;
    assert r1After == r1Before + amount1In  - amount1Out;

    // y1*x1 > y0*x0
    assert r1After * r0After > r1Before * r0Before;
}

// rule a(env e, bytes data) {

//     setup(e);
//     require balanceEqualReserve();
//     require data.length == 1;

//     uint112 r0Before; uint112 r1Before;
//     (r0Before, r1Before, _) = getReserves();

//     uint amount0Out; uint amount1Out;

//     // Swap it up
//     swap(e, amount0Out, amount1Out, e.msg.sender, data);

//     uint112 r0After; uint112 r1After;
//     (r0After, r1After, _) = getReserves();

//     // y1*x1 > y0*x0
//     assert r1After * r0After > r1Before * r0Before;
// }


/* DONE
Price of AMM must be the same before and after any operation (except swap).
        (reserves0 ⋅ reserves1)ᵖʳᵉ == (reserves0 ⋅ reserves1)ᵖᵒˢᵗ
*/
rule integrityOfMainInvariant(env e1, method f, env e2, method g) filtered 
{   // reserves increase on swap
    f -> f.selector != sig:swap(uint,uint,address,bytes).selector && onlyPoolMethods(f),
    g -> g.selector != sig:swap(uint,uint,address,bytes).selector && onlyPoolMethods(g)
} {
    // TODO: reAssess
    require _factory.feeTo() != 0;
    require balanceEqualReserve();
    requireInvariant integrityOfTotalSupply();

    
    setup(e1);
    routerHandlerFnCall(e1, f);

    uint before = _pool.kLast;

    setup(e2);
    routerHandlerFnCall(e2, g);

    uint after = _pool.kLast;

    // y0/x0 == y1/x1
    assert before == after, "Prices are not equal";
}


/*
TWAP integrity
    Given a scenario where any main operations at two points of timestamp, Holds the correct last price cumulative
*/
rule integrityOfTWAP(env e, method f, calldataarg args) filtered {
    f -> f.selector == sig:sync().selector        || 
         f.selector == sig:burn(address).selector ||
         f.selector == sig:mint(address).selector ||
         f.selector == sig:swap(uint,uint,address,bytes).selector
} {
    setup(e);

    uint112 r0; uint112 r1; uint32 b0; uint32 b1;

    (r0, r1, b0) = getReserves();
    uint before0 = price0CumulativeLast();
    uint before1 = price1CumulativeLast();

    f(e, args);

    (_, _, b1) = getReserves();
    uint after0 = price0CumulativeLast();
    uint after1 = price1CumulativeLast();

    uint32 timeElapsed = safeSub32(b1, b0);

    assert (safeSub(after0, before0) == encodePrice(r0, r1) * timeElapsed &&
            safeSub(after1, before1) == encodePrice(r1, r0) * timeElapsed ), "Wrong Price cumulative";
}


/*
If fee is on, mint liquidity equivalent to 1/6th of the growth in sqrt(k) for the feeTo address
*/
rule integrityOfProtocolFee(env e,method f, calldataarg args) filtered {
    f -> f.selector == sig:burn(address).selector ||
         f.selector == sig:mint(address).selector
} {

    setup(e);
    require _pool != _factory.feeTo();

    uint112 reserve0; uint112 reserve1;
    (reserve0, reserve1, _) = getReserves();

    uint rootK = floorSqrt(require_uint256(reserve0 * reserve1));
    uint rootKLast = floorSqrt(_pool.kLast);
    bool feeToOn = _factory.feeTo() != 0 && _pool.kLast != 0 && rootK > rootKLast;
    uint balanceBefore = balanceOf(_factory.feeTo());
    uint totalSupplyBefore = totalSupply();

    f(e, args);

    require f.selector == sig:burn(address).selector => _pool.reserve0 != 0 && _pool.reserve1 != 0;

    uint protocolFeeMargin = assert_uint256(balanceOf(_factory.feeTo()) - balanceBefore);

    assert _factory.feeTo() == 0 <=> _pool.kLast == 0;
    assert feeToOn => protocolFeeMargin == assert_uint256((totalSupplyBefore * (rootK - rootKLast)) / ((rootK * 5) + rootKLast));
}


/*
Modifying reserves are only associated with the corresponding function. e.g Only the burn function can decreases reserves
*/
/// NOTE: since the tokens are not rebasing tokens, we are free to assume that decreasing reserves are only associated to the burn operation and not the sync function. because the balance of pool in rebasing tokens could be lower than the reserves so calling sync would decrease the reserves
rule onlyAssociatedFn(env e, method f) filtered { f -> onlyPoolMethods(f) } {

    setup(e);
    require balanceEqualReserve();
    requireInvariant integrityOfTotalSupply();

    uint112 before0; uint112 before1;
    (before0, before1, _) = getReserves();

    routerHandlerFnCall(e, f);

    uint112 after0; uint112 after1;
    (after0, after1, _) = getReserves();
    
    assert f.selector == sig:burn(address).selector                <=> before0 > after0 && before1 > after1;
    assert f.selector == sig:mint(address).selector                 => before0 < after0 && before1 < after1;
    assert f.selector == sig:swap(uint,uint,address,bytes).selector => after0 * after1  > before0 * before1;
}


/*
Only the user or an allowed spender can decrease the user's LP balance.
*/
rule noDecreaseByOthers(env e, method f, calldataarg args) filtered { f -> onlyPoolMethods(f) } {
    setup(e);
    address account;
    require account != _pool && account != _flr;
    require allowance(account, _flr) == 0;
    uint allowance = allowance(account, e.msg.sender);
    uint before = balanceOf(account);

    f(e, args); 
    
    uint after = balanceOf(account);
    assert after < before => (e.msg.sender == account || allowance >= (before - after));
}


/*
Only the factory can call the initialize function and set the tokens
*/ 
rule initIntegrity() {
    require _token0 < _token1;
    _factory.createPair(_token0, _token1);
    // Main checks are handled in the cvlInitialize func
    assert true;
}


/*
The more tokens are send, more liquidity user will get
*/
rule monotonicityOfMint(env e, uint x, uint y, address token) {
    setup(e);
    require x > y;
    requireInvariant integrityOfTotalSupply();
    requireInvariant balanceGreaterThanReserve();
    require token == _token0 || token == _token1;
    storage init = lastStorage;

    token.transfer(e, _pool, x);
    mint(e, e.msg.sender);
    uint before = balanceOf(e.msg.sender);

    token.transfer(e, _pool, y) at init;
    mint(e, e.msg.sender);
    uint after = balanceOf(e.msg.sender);
    assert before >= after;
}


/*
The more liquidities are burned, more tokens user will get
*/
rule monotonicityOfBurn(env e, uint x, uint y, address token) {
    setup(e);
    require x > y;
    requireInvariant balanceGreaterThanReserve();
    requireInvariant integrityOfTotalSupply();
    storage init = lastStorage;

    _pool.transfer(e, _pool, x);
    uint before0; uint before1;
    (before0, before1) = burn(e, e.msg.sender);

    _pool.transfer(e, _pool, y) at init;
    uint after0; uint after1;
    (after0, after1) = burn(e, e.msg.sender);

    assert before0 >= after0 && before1 >= after1;
    
}


/*
Balances and reserves are equal after any function call
*/
rule balanceMatchesReserveAtTheEnd(env e, method f, calldataarg args) filtered { 
    f -> f.selector == sig:sync().selector        || 
         f.selector == sig:burn(address).selector ||
         f.selector == sig:mint(address).selector ||
         f.selector == sig:skim(address).selector ||
         f.selector == sig:swap(uint,uint,address,bytes).selector } {

    f(e, args);

    uint112 reserve0; uint112 reserve1;
    (reserve0, reserve1, _) = getReserves();

    uint balance0 = assert_uint112(_token0.balanceOf(_pool));
    uint balance1 = assert_uint112(_token1.balanceOf(_pool));

    assert balance0 == reserve0 && balance1 == reserve1, "Balances and Reserves mismatched";
}


/*
Integrity of totalSupply with respect to the amount of reserves. 
*/
invariant integrityOfTotalSupply()
    
    (totalSupply() != 0 <=> _pool.reserve0 != 0) &&
    (totalSupply() != 0 <=> _pool.reserve1 != 0) &&
    (totalSupply() == 0 <=> _pool.reserve0 == 0) &&
    (totalSupply() == 0 <=> _pool.reserve1 == 0) 

    // If we don't exclude the sync function, then when reserves are zero, 
    // a user could donates tokens to the pool and calls sync to update the reserves
    // which will violates the invariant cause now the reserves are non-zero but no liquidity is minted yet.
    // Since it's not rational, we filter the sync function
    filtered { f -> f.selector != sig:sync().selector && onlyPoolMethods(f) }
    {
        preserved with (env e1) {
            setup(e1);
            requireInvariant balanceGreaterThanReserve();
        }

        // If we burn liquidity and transfer the tokens to pool itself (to == pool), 
        // Then the totalSupply will be zero but reserves gets non-zero. 
        // Since it's not rational to donate liquidity to the pool itself, we assume to != pool
        preserved burn(address to) with (env e2) {
            setup(e2);
            require to != _pool;
        }
    }


/*
For both token0 and token1 the balance of the system is at least as much as the reserves.
*/
invariant balanceGreaterThanReserve()
    (_pool.reserve0 <= _token0.balanceOf(_pool)) &&
    (_pool.reserve1 <= _token1.balanceOf(_pool))
    filtered { f -> onlyPoolMethods(f) }
    {
        preserved with (env e){
         setup(e);
        }

        preserved _.transferFrom(address from, address to , uint256 value) with (env e1) {
            requireInvariant allowanceOfPoolAlwaysZero(e1.msg.sender);
            require e1.msg.sender != _pool;
        }

        preserved _.transfer(address to, uint256 value) with (env e2) {
            require e2.msg.sender != _pool;
        }
    }

/*
Pool can't and won't approve any user. therefore the allowance of pool is always zero
*/
invariant allowanceOfPoolAlwaysZero(address a)
    _token0.allowance(_pool, a) == 0 && _token1.allowance(_pool, a) == 0
    filtered { f -> onlyPoolMethods(f) }
    {
        preserved _.approve(address spender, uint256 value) with (env e1) {
            require e1.msg.sender != _pool;
        }

        preserved _.increaseAllowance(address spender, uint256 addedValue) with (env e2) {
            require e2.msg.sender != _pool;
        }
    }


/*
Sum of all balances is equal to total supply
 */
strong invariant sumFunds() 
    sumBalances == totalSupply()
    filtered { f -> onlyPoolMethods(f) }


/*
Pool contract doesn't hold any liquidity after any operation.
    Given that any user could transfer liquidity to the pool, we assume they won't, as it wouldn't be rational.
*/
invariant balanceOfPoolRationallyAlwaysZero()
    balanceOf(_pool) == 0
    filtered { f -> onlyPoolMethods(f) }
    {
        preserved with (env e1) {
            setup(e1);
        }
        preserved mint(address to) with (env e2) {
            setup(e2);
            // We intentionally don't express the router actions for adding liquidity to cover all scenarios
            require to != _pool;
        }
        
        preserved transfer(address to, uint value) with (env e3) {
            require to != _pool;
            require e3.msg.sender != _pool;
        }

        preserved transferFrom(address from, address to, uint value) with (env e4) {
            require to != _pool;
            require e4.msg.sender != _pool;
        }

        // A user should send liquidity to pool contract before calling burn function to remove liquidity
        // We do this to avoid vacuousness and prove that sending liquidity to pool and calling burn, still holds the invariant
        preserved burn(address to) with (env e5) {
            setup(e5);
            require to != _pool;
            uint liquidity;
            _pool.transfer(e5, _pool, liquidity);
            // At the end of the burn operation, balance of pool remains zero
        }

        preserved swap(uint amount0Out, uint amount1Out, address to, bytes data) with (env e6) {
            setup(e6);
            // Flash loan contract could send liquidity to the v2Pair contract which violates the invariant
            // Since it's not rational, we assume this
            require data.length == 0;
        }
    }

/*
After the first mint, total supply never gets zero.
*/
rule neverGetZero(env e, method f, calldataarg args) filtered { f -> onlyPoolMethods(f) } {
    uint256 MINIMUM_LIQUIDITY = 1000;
    require balanceOf(0) == MINIMUM_LIQUIDITY;
    require totalSupply() >= balanceOf(0) + balanceOf(e.msg.sender) + balanceOf(_pool);

    f(e, args);

    assert totalSupply() >= MINIMUM_LIQUIDITY;
}