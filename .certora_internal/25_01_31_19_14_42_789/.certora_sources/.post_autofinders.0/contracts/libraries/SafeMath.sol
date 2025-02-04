pragma solidity =0.5.16;

// a library for performing overflow-safe math, courtesy of DappHub (https://github.com/dapphub/ds-math)

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00650000, 1037618708581) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00650001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00650005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00656001, y) }
        require((z = x + y) >= x, 'ds-math-add-overflow');
    }

    function sub(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00660000, 1037618708582) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00660001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00660005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00666001, y) }
        require((z = x - y) <= x, 'ds-math-sub-underflow');
    }

    function mul(uint x, uint y) internal pure returns (uint z) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00670000, 1037618708583) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00670001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00670005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00676001, y) }
        require(y == 0 || (z = x * y) / y == x, 'ds-math-mul-overflow');
    }
}
