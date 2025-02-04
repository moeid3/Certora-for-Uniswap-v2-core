pragma solidity =0.5.16;

// a library for performing overflow-safe math, courtesy of DappHub (https://github.com/dapphub/ds-math)

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00900000, 1037618708624) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00900001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00900005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00906001, y) }
        require((z = x + y) >= x, 'ds-math-add-overflow');
    }

    function sub(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00910000, 1037618708625) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00910001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00910005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00916001, y) }
        require((z = x - y) <= x, 'ds-math-sub-underflow');
    }

    function mul(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00920000, 1037618708626) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00920001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00920005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00926001, y) }
        require(y == 0 || (z = x * y) / y == x, 'ds-math-mul-overflow');
    }
}
