pragma solidity =0.5.16;

// a library for performing overflow-safe math, courtesy of DappHub (https://github.com/dapphub/ds-math)

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00940000, 1037618708628) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00940001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00940005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00946001, y) }
        require((z = x + y) >= x, 'ds-math-add-overflow');
    }

    function sub(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00950000, 1037618708629) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00950001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00950005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00956001, y) }
        require((z = x - y) <= x, 'ds-math-sub-underflow');
    }

    function mul(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00960000, 1037618708630) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00960001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00960005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00966001, y) }
        require(y == 0 || (z = x * y) / y == x, 'ds-math-mul-overflow');
    }
}
