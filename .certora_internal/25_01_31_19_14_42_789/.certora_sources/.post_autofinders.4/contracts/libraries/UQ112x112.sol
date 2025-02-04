pragma solidity =0.5.16;

// a library for handling binary fixed point numbers (https://en.wikipedia.org/wiki/Q_(number_format))

// range: [0, 2**112 - 1]
// resolution: 1 / 2**112

library UQ112x112 {
    uint224 constant Q112 = 2**112;

    // encode a uint112 as a UQ112x112
    function encode(uint112 y) internal pure returns (uint224 z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00970000, 1037618708631) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00970001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00970005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00976000, y) }
        z = uint224(y) * Q112;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002b,z)} // never overflows
    }

    // divide a UQ112x112 by a uint112, returning a UQ112x112
    function uqdiv(uint224 x, uint112 y) internal pure returns (uint224 z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00980000, 1037618708632) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00980001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00980005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00986001, y) }
        z = x / uint224(y);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002c,z)}
    }
}
