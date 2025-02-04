pragma solidity =0.5.16;

// a library for performing various math operations

library Math {
    function min(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00920000, 1037618708626) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00920001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00920005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00926001, y) }
        z = x < y ? x : y;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000028,z)}
    }

    // babylonian method (https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method)
    function sqrt(uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00930000, 1037618708627) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00930001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00930005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00936000, y) }
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000029,z)}
                x = (y / x + x) / 2;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002a,x)}
            }
        } else if (y != 0) {
            z = 1;
        }
    }
}
