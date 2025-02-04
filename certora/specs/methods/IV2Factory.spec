 methods {
    function getPair(address, address) external returns address envfree;
    function allPairsLength() external returns uint envfree;
    function feeTo() external returns address envfree;
    function feeToSetter() external returns address envfree;
    function allPairs(uint) external returns address envfree;
    function createPair(address,address) external returns address envfree;
    function _.initialize(address token0, address token1) external => cvlInit(token0, token1) expect void;
 }