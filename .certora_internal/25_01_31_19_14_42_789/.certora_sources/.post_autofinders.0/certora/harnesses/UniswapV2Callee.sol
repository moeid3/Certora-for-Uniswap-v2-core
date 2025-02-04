pragma solidity =0.5.16;

import "../../contracts/interfaces/IUniswapV2Pair.sol";
import "../helpers/ArbitraryValues.sol";
import "../../contracts/libraries/SafeMath.sol";
import "../../contracts/interfaces/IERC20.sol";



/**
 * A flexible implementation of the FlashLoan Receiver callback that
 * nondeterministically makes calls back to the pool.
 */
contract UniswapV2Callee is ArbitraryValues {
    using SafeMath for uint;
    IUniswapV2Pair pool;

    /**
     * Nondeterministically call v2Pair functions.
     */
    function uniswapV2Call(address sender, uint amount0, uint amount1, bytes calldata data) external {
        uint callbackChoice = arbitraryUint();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,callbackChoice)}

        if (callbackChoice == 0)
            pool.sync();
        else if (callbackChoice == 1)
            pool.skim(arbitraryAddress());
        else if (callbackChoice == 2)
            pool.mint(arbitraryAddress());
        else if (callbackChoice == 3)
            pool.burn(arbitraryAddress());
        else if (callbackChoice == 4)
            pool.approve(arbitraryAddress(),arbitraryUint());
        else if (callbackChoice == 5)
            pool.transfer(arbitraryAddress(),arbitraryUint());
        else if (callbackChoice == 6)
            pool.transferFrom(arbitraryAddress(),arbitraryAddress(),arbitraryUint());
        else if (callbackChoice == 7)
            pool.swap(arbitraryUint(),arbitraryUint(),arbitraryAddress(),data);
        else if (callbackChoice == 8)
            pool.permit(
                arbitraryAddress(), arbitraryAddress(),
                arbitraryUint(), arbitraryUint(),
                arbitraryUint8(), arbitraryBytes32(), arbitraryBytes32()
                );

        (uint r0, uint r1,) = pool.getReserves();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010002,0)}
        if(amount0 > 0) {
            uint amountToRepay = getAmountIn(amount0, r1, r0);
            // Suppose the user did some arbs and successfully repays 
            IERC20(pool.token0()).transferFrom(sender, address(pool), amountToRepay);
        }

        if(amount1 > 0) {
            uint amountToRepay = getAmountIn(amount1, r0, r1);
            IERC20(pool.token1()).transferFrom(sender, address(pool), amountToRepay);
       }
    }

    // given an output amount of an asset and pair reserves, returns a required input amount of the other asset
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) internal pure returns (uint amountIn) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006002, reserveOut) }
        require(amountOut > 0, 'UniswapV2Library: INSUFFICIENT_OUTPUT_AMOUNT');
        require(reserveIn > 0 && reserveOut > 0, 'UniswapV2Library: INSUFFICIENT_LIQUIDITY');
        uint numerator = reserveIn.mul(amountOut).mul(1000);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,numerator)}
        uint denominator = reserveOut.sub(amountOut).mul(997);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,denominator)}
        amountIn = (numerator / denominator).add(1);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,amountIn)}
    }

}

