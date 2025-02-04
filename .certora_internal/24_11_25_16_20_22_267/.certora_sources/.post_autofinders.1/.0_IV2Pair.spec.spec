methods {
    function token0()                                          external returns (address)                  envfree;
    function token1()                                          external returns (address)                  envfree;
    function totalSupply()                                     external returns (uint256)                  envfree;
    function getReserves()                                     external returns (uint112, uint112, uint32) envfree;
    function balanceOf(address)                                external returns (uint256)                  envfree;
    function price1CumulativeLast()                            external returns (uint256)                  envfree;
    function price0CumulativeLast()                            external returns (uint256)                  envfree;
    function allowance(address,address)                        external returns (uint256)                  envfree;
    function getAmountIn(uint,uint,uint)                    internal returns (uint256);
}