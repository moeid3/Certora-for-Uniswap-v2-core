pragma solidity =0.5.16;

import "../../contracts/interfaces/IUniswapV2Pair.sol";
import "../helpers/ArbitraryValues.sol";



/**
 * A flexible implementation of the FlashLoan Receiver callback that
 * nondeterministically makes calls back to the pool.
 */
contract UniswapV2Callee is ArbitraryValues {
    IUniswapV2Pair pool;

    /**
     * Nondeterministically call v2Pair functions.
     */
    function uniswapV2Call(bytes calldata data) external {

        uint callbackChoice = arbitraryUint();

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
        // else if (callbackChoice == 8)
        //     pool.permit(
        //         arbitraryAddress(), arbitraryAddress(),
        //         arbitraryUint(), block.timestamp,
        //         arbitraryUint8(), arbitraryBytes32(), arbitraryBytes32()
        //         );

    }
}

