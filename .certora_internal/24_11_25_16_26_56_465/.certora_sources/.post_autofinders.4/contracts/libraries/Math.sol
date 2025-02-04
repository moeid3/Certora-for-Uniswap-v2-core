pragma solidity =0.5.16;

// a library for performing various math operations

library Math {
    function min(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff008e0000, 1037618708622) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff008e0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff008e0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff008e6001, y) }
        z = x < y ? x : y;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002b,z)}
    }

    // babylonian method (https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method)
    function sqrt(uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff008f0000, 1037618708623) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff008f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff008f0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff008f6000, y) }
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002c,z)}
                x = (y / x + x) / 2;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002d,x)}
            }
        } else if (y != 0) {
            z = 1;
        }
    }
}
