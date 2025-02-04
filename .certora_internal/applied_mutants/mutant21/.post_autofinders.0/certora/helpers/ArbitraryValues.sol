pragma solidity =0.5.16;

/**
 * This is a utility contract for constructing harnesses for the Certora Prover.
 *
 * Harnesses can inherit this contract and then call methods such as
 * {arbitraryBool}, {arbitraryUint} and others.  The Certora Prover will choose a
 * new non-deterministic value for each call to one of these methods.
 */
contract ArbitraryValues {

    /*
     * These mappings are used to create arbitrary values for the prover.
     * The Certora Prover is allowed to choose any value for arbitraryUints[k] and
     * for arbitraryAddresses[k], so it has a lot of flexibility in choosing
     * the behavior of this contract when constructing counterexamples.
     *
     * Each time we need a new value, we use {counter} to index into the
     * mappings, and then increment {counter} (allowing the Certora Prover to choose
     * a different value for the next arbitrary value).
     */

    uint8 private counter;

    

    
        
    mapping (uint8 => bool) private arbitraryBools;

    /** nondeterministic bool value */
    function arbitraryBool() internal returns(bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
        return arbitraryBools[counter++];
    }  
        
    mapping (uint8 => address) private arbitraryAddresss;

    /** nondeterministic address value */
    function arbitraryAddress() internal returns(address) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
        return arbitraryAddresss[counter++];
    }  
        
    mapping (uint8 => int) private arbitraryInts;

    /** nondeterministic int value */
    function arbitraryInt() internal returns(int) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
        return arbitraryInts[counter++];
    }  
        
    mapping (uint8 => uint) private arbitraryUints;

    /** nondeterministic uint value */
    function arbitraryUint() internal returns(uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
        return arbitraryUints[counter++];
    }  
    
        
            
    mapping (uint8 => uint8) private arbitraryUint8s;

    /** nondeterministic uint8 value */
    function arbitraryUint8() internal returns(uint8) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
        return arbitraryUint8s[counter++];
    }  
            
    mapping (uint8 => uint16) private arbitraryUint16s;

    /** nondeterministic uint16 value */
    function arbitraryUint16() internal returns(uint16) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) }
        return arbitraryUint16s[counter++];
    }  
            
    mapping (uint8 => uint24) private arbitraryUint24s;

    /** nondeterministic uint24 value */
    function arbitraryUint24() internal returns(uint24) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
        return arbitraryUint24s[counter++];
    }  
            
    mapping (uint8 => uint32) private arbitraryUint32s;

    /** nondeterministic uint32 value */
    function arbitraryUint32() internal returns(uint32) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070004, 0) }
        return arbitraryUint32s[counter++];
    }  
            
    mapping (uint8 => uint40) private arbitraryUint40s;

    /** nondeterministic uint40 value */
    function arbitraryUint40() internal returns(uint40) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080004, 0) }
        return arbitraryUint40s[counter++];
    }  
            
    mapping (uint8 => uint48) private arbitraryUint48s;

    /** nondeterministic uint48 value */
    function arbitraryUint48() internal returns(uint48) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090004, 0) }
        return arbitraryUint48s[counter++];
    }  
            
    mapping (uint8 => uint56) private arbitraryUint56s;

    /** nondeterministic uint56 value */
    function arbitraryUint56() internal returns(uint56) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0004, 0) }
        return arbitraryUint56s[counter++];
    }  
            
    mapping (uint8 => uint64) private arbitraryUint64s;

    /** nondeterministic uint64 value */
    function arbitraryUint64() internal returns(uint64) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0004, 0) }
        return arbitraryUint64s[counter++];
    }  
            
    mapping (uint8 => uint72) private arbitraryUint72s;

    /** nondeterministic uint72 value */
    function arbitraryUint72() internal returns(uint72) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0004, 0) }
        return arbitraryUint72s[counter++];
    }  
            
    mapping (uint8 => uint80) private arbitraryUint80s;

    /** nondeterministic uint80 value */
    function arbitraryUint80() internal returns(uint80) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0004, 0) }
        return arbitraryUint80s[counter++];
    }  
            
    mapping (uint8 => uint88) private arbitraryUint88s;

    /** nondeterministic uint88 value */
    function arbitraryUint88() internal returns(uint88) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0004, 0) }
        return arbitraryUint88s[counter++];
    }  
            
    mapping (uint8 => uint96) private arbitraryUint96s;

    /** nondeterministic uint96 value */
    function arbitraryUint96() internal returns(uint96) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0004, 0) }
        return arbitraryUint96s[counter++];
    }  
            
    mapping (uint8 => uint104) private arbitraryUint104s;

    /** nondeterministic uint104 value */
    function arbitraryUint104() internal returns(uint104) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120004, 0) }
        return arbitraryUint104s[counter++];
    }  
            
    mapping (uint8 => uint112) private arbitraryUint112s;

    /** nondeterministic uint112 value */
    function arbitraryUint112() internal returns(uint112) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110004, 0) }
        return arbitraryUint112s[counter++];
    }  
            
    mapping (uint8 => uint120) private arbitraryUint120s;

    /** nondeterministic uint120 value */
    function arbitraryUint120() internal returns(uint120) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100004, 0) }
        return arbitraryUint120s[counter++];
    }  
            
    mapping (uint8 => uint128) private arbitraryUint128s;

    /** nondeterministic uint128 value */
    function arbitraryUint128() internal returns(uint128) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130004, 0) }
        return arbitraryUint128s[counter++];
    }  
            
    mapping (uint8 => uint136) private arbitraryUint136s;

    /** nondeterministic uint136 value */
    function arbitraryUint136() internal returns(uint136) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140004, 0) }
        return arbitraryUint136s[counter++];
    }  
            
    mapping (uint8 => uint144) private arbitraryUint144s;

    /** nondeterministic uint144 value */
    function arbitraryUint144() internal returns(uint144) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150004, 0) }
        return arbitraryUint144s[counter++];
    }  
            
    mapping (uint8 => uint152) private arbitraryUint152s;

    /** nondeterministic uint152 value */
    function arbitraryUint152() internal returns(uint152) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160004, 0) }
        return arbitraryUint152s[counter++];
    }  
            
    mapping (uint8 => uint160) private arbitraryUint160s;

    /** nondeterministic uint160 value */
    function arbitraryUint160() internal returns(uint160) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210000, 1037618708513) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210004, 0) }
        return arbitraryUint160s[counter++];
    }  
            
    mapping (uint8 => uint168) private arbitraryUint168s;

    /** nondeterministic uint168 value */
    function arbitraryUint168() internal returns(uint168) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220000, 1037618708514) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220004, 0) }
        return arbitraryUint168s[counter++];
    }  
            
    mapping (uint8 => uint176) private arbitraryUint176s;

    /** nondeterministic uint176 value */
    function arbitraryUint176() internal returns(uint176) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230000, 1037618708515) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230004, 0) }
        return arbitraryUint176s[counter++];
    }  
            
    mapping (uint8 => uint184) private arbitraryUint184s;

    /** nondeterministic uint184 value */
    function arbitraryUint184() internal returns(uint184) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0004, 0) }
        return arbitraryUint184s[counter++];
    }  
            
    mapping (uint8 => uint192) private arbitraryUint192s;

    /** nondeterministic uint192 value */
    function arbitraryUint192() internal returns(uint192) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0004, 0) }
        return arbitraryUint192s[counter++];
    }  
            
    mapping (uint8 => uint200) private arbitraryUint200s;

    /** nondeterministic uint200 value */
    function arbitraryUint200() internal returns(uint200) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200004, 0) }
        return arbitraryUint200s[counter++];
    }  
            
    mapping (uint8 => uint208) private arbitraryUint208s;

    /** nondeterministic uint208 value */
    function arbitraryUint208() internal returns(uint208) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170004, 0) }
        return arbitraryUint208s[counter++];
    }  
            
    mapping (uint8 => uint216) private arbitraryUint216s;

    /** nondeterministic uint216 value */
    function arbitraryUint216() internal returns(uint216) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180004, 0) }
        return arbitraryUint216s[counter++];
    }  
            
    mapping (uint8 => uint224) private arbitraryUint224s;

    /** nondeterministic uint224 value */
    function arbitraryUint224() internal returns(uint224) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190004, 0) }
        return arbitraryUint224s[counter++];
    }  
            
    mapping (uint8 => uint232) private arbitraryUint232s;

    /** nondeterministic uint232 value */
    function arbitraryUint232() internal returns(uint232) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0004, 0) }
        return arbitraryUint232s[counter++];
    }  
            
    mapping (uint8 => uint240) private arbitraryUint240s;

    /** nondeterministic uint240 value */
    function arbitraryUint240() internal returns(uint240) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0004, 0) }
        return arbitraryUint240s[counter++];
    }  
            
    mapping (uint8 => uint248) private arbitraryUint248s;

    /** nondeterministic uint248 value */
    function arbitraryUint248() internal returns(uint248) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0004, 0) }
        return arbitraryUint248s[counter++];
    }  
            
    mapping (uint8 => uint256) private arbitraryUint256s;

    /** nondeterministic uint256 value */
    function arbitraryUint256() internal returns(uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0004, 0) }
        return arbitraryUint256s[counter++];
    }   
        
            
    mapping (uint8 => int8) private arbitraryInt8s;

    /** nondeterministic int8 value */
    function arbitraryInt8() internal returns(int8) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00430000, 1037618708547) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00430001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00430004, 0) }
        return arbitraryInt8s[counter++];
    }  
            
    mapping (uint8 => int16) private arbitraryInt16s;

    /** nondeterministic int16 value */
    function arbitraryInt16() internal returns(int16) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00440000, 1037618708548) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00440001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00440004, 0) }
        return arbitraryInt16s[counter++];
    }  
            
    mapping (uint8 => int24) private arbitraryInt24s;

    /** nondeterministic int24 value */
    function arbitraryInt24() internal returns(int24) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00450000, 1037618708549) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00450001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00450004, 0) }
        return arbitraryInt24s[counter++];
    }  
            
    mapping (uint8 => int32) private arbitraryInt32s;

    /** nondeterministic int32 value */
    function arbitraryInt32() internal returns(int32) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00460000, 1037618708550) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00460001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00460004, 0) }
        return arbitraryInt32s[counter++];
    }  
            
    mapping (uint8 => int40) private arbitraryInt40s;

    /** nondeterministic int40 value */
    function arbitraryInt40() internal returns(int40) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00470000, 1037618708551) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00470001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00470004, 0) }
        return arbitraryInt40s[counter++];
    }  
            
    mapping (uint8 => int48) private arbitraryInt48s;

    /** nondeterministic int48 value */
    function arbitraryInt48() internal returns(int48) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00340000, 1037618708532) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00340001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00340004, 0) }
        return arbitraryInt48s[counter++];
    }  
            
    mapping (uint8 => int56) private arbitraryInt56s;

    /** nondeterministic int56 value */
    function arbitraryInt56() internal returns(int56) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00350000, 1037618708533) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00350001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00350004, 0) }
        return arbitraryInt56s[counter++];
    }  
            
    mapping (uint8 => int64) private arbitraryInt64s;

    /** nondeterministic int64 value */
    function arbitraryInt64() internal returns(int64) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00360000, 1037618708534) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00360001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00360004, 0) }
        return arbitraryInt64s[counter++];
    }  
            
    mapping (uint8 => int72) private arbitraryInt72s;

    /** nondeterministic int72 value */
    function arbitraryInt72() internal returns(int72) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00370000, 1037618708535) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00370001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00370004, 0) }
        return arbitraryInt72s[counter++];
    }  
            
    mapping (uint8 => int80) private arbitraryInt80s;

    /** nondeterministic int80 value */
    function arbitraryInt80() internal returns(int80) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00490000, 1037618708553) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00490001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00490004, 0) }
        return arbitraryInt80s[counter++];
    }  
            
    mapping (uint8 => int88) private arbitraryInt88s;

    /** nondeterministic int88 value */
    function arbitraryInt88() internal returns(int88) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004a0000, 1037618708554) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004a0004, 0) }
        return arbitraryInt88s[counter++];
    }  
            
    mapping (uint8 => int96) private arbitraryInt96s;

    /** nondeterministic int96 value */
    function arbitraryInt96() internal returns(int96) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004b0000, 1037618708555) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004b0004, 0) }
        return arbitraryInt96s[counter++];
    }  
            
    mapping (uint8 => int104) private arbitraryInt104s;

    /** nondeterministic int104 value */
    function arbitraryInt104() internal returns(int104) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004c0000, 1037618708556) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004c0004, 0) }
        return arbitraryInt104s[counter++];
    }  
            
    mapping (uint8 => int112) private arbitraryInt112s;

    /** nondeterministic int112 value */
    function arbitraryInt112() internal returns(int112) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004d0000, 1037618708557) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004d0004, 0) }
        return arbitraryInt112s[counter++];
    }  
            
    mapping (uint8 => int120) private arbitraryInt120s;

    /** nondeterministic int120 value */
    function arbitraryInt120() internal returns(int120) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004e0000, 1037618708558) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004e0004, 0) }
        return arbitraryInt120s[counter++];
    }  
            
    mapping (uint8 => int128) private arbitraryInt128s;

    /** nondeterministic int128 value */
    function arbitraryInt128() internal returns(int128) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004f0000, 1037618708559) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff004f0004, 0) }
        return arbitraryInt128s[counter++];
    }  
            
    mapping (uint8 => int136) private arbitraryInt136s;

    /** nondeterministic int136 value */
    function arbitraryInt136() internal returns(int136) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00500000, 1037618708560) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00500001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00500004, 0) }
        return arbitraryInt136s[counter++];
    }  
            
    mapping (uint8 => int144) private arbitraryInt144s;

    /** nondeterministic int144 value */
    function arbitraryInt144() internal returns(int144) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00510000, 1037618708561) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00510001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00510004, 0) }
        return arbitraryInt144s[counter++];
    }  
            
    mapping (uint8 => int152) private arbitraryInt152s;

    /** nondeterministic int152 value */
    function arbitraryInt152() internal returns(int152) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00520000, 1037618708562) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00520001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00520004, 0) }
        return arbitraryInt152s[counter++];
    }  
            
    mapping (uint8 => int160) private arbitraryInt160s;

    /** nondeterministic int160 value */
    function arbitraryInt160() internal returns(int160) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00380000, 1037618708536) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00380001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00380004, 0) }
        return arbitraryInt160s[counter++];
    }  
            
    mapping (uint8 => int168) private arbitraryInt168s;

    /** nondeterministic int168 value */
    function arbitraryInt168() internal returns(int168) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005e0000, 1037618708574) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005e0004, 0) }
        return arbitraryInt168s[counter++];
    }  
            
    mapping (uint8 => int176) private arbitraryInt176s;

    /** nondeterministic int176 value */
    function arbitraryInt176() internal returns(int176) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005f0000, 1037618708575) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005f0004, 0) }
        return arbitraryInt176s[counter++];
    }  
            
    mapping (uint8 => int184) private arbitraryInt184s;

    /** nondeterministic int184 value */
    function arbitraryInt184() internal returns(int184) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00600000, 1037618708576) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00600001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00600004, 0) }
        return arbitraryInt184s[counter++];
    }  
            
    mapping (uint8 => int192) private arbitraryInt192s;

    /** nondeterministic int192 value */
    function arbitraryInt192() internal returns(int192) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00610000, 1037618708577) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00610001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00610004, 0) }
        return arbitraryInt192s[counter++];
    }  
            
    mapping (uint8 => int200) private arbitraryInt200s;

    /** nondeterministic int200 value */
    function arbitraryInt200() internal returns(int200) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00620000, 1037618708578) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00620001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00620004, 0) }
        return arbitraryInt200s[counter++];
    }  
            
    mapping (uint8 => int208) private arbitraryInt208s;

    /** nondeterministic int208 value */
    function arbitraryInt208() internal returns(int208) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00630000, 1037618708579) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00630001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00630004, 0) }
        return arbitraryInt208s[counter++];
    }  
            
    mapping (uint8 => int216) private arbitraryInt216s;

    /** nondeterministic int216 value */
    function arbitraryInt216() internal returns(int216) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00530000, 1037618708563) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00530001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00530004, 0) }
        return arbitraryInt216s[counter++];
    }  
            
    mapping (uint8 => int224) private arbitraryInt224s;

    /** nondeterministic int224 value */
    function arbitraryInt224() internal returns(int224) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00540000, 1037618708564) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00540001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00540004, 0) }
        return arbitraryInt224s[counter++];
    }  
            
    mapping (uint8 => int232) private arbitraryInt232s;

    /** nondeterministic int232 value */
    function arbitraryInt232() internal returns(int232) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00550000, 1037618708565) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00550001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00550004, 0) }
        return arbitraryInt232s[counter++];
    }  
            
    mapping (uint8 => int240) private arbitraryInt240s;

    /** nondeterministic int240 value */
    function arbitraryInt240() internal returns(int240) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00560000, 1037618708566) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00560001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00560004, 0) }
        return arbitraryInt240s[counter++];
    }  
            
    mapping (uint8 => int248) private arbitraryInt248s;

    /** nondeterministic int248 value */
    function arbitraryInt248() internal returns(int248) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003f0000, 1037618708543) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003f0004, 0) }
        return arbitraryInt248s[counter++];
    }  
            
    mapping (uint8 => int256) private arbitraryInt256s;

    /** nondeterministic int256 value */
    function arbitraryInt256() internal returns(int256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00400000, 1037618708544) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00400001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00400004, 0) }
        return arbitraryInt256s[counter++];
    }   
    
        
    mapping (uint8 => bytes1) private arbitraryBytes1s;

    /** nondeterministic bytes1 value */
    function arbitraryBytes1() internal returns(bytes1) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00410000, 1037618708545) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00410001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00410004, 0) }
        return arbitraryBytes1s[counter++];
    }  
        
    mapping (uint8 => bytes2) private arbitraryBytes2s;

    /** nondeterministic bytes2 value */
    function arbitraryBytes2() internal returns(bytes2) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00420000, 1037618708546) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00420001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00420004, 0) }
        return arbitraryBytes2s[counter++];
    }  
        
    mapping (uint8 => bytes3) private arbitraryBytes3s;

    /** nondeterministic bytes3 value */
    function arbitraryBytes3() internal returns(bytes3) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002e0000, 1037618708526) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002e0004, 0) }
        return arbitraryBytes3s[counter++];
    }  
        
    mapping (uint8 => bytes4) private arbitraryBytes4s;

    /** nondeterministic bytes4 value */
    function arbitraryBytes4() internal returns(bytes4) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002f0000, 1037618708527) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002f0004, 0) }
        return arbitraryBytes4s[counter++];
    }  
        
    mapping (uint8 => bytes5) private arbitraryBytes5s;

    /** nondeterministic bytes5 value */
    function arbitraryBytes5() internal returns(bytes5) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00300000, 1037618708528) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00300001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00300004, 0) }
        return arbitraryBytes5s[counter++];
    }  
        
    mapping (uint8 => bytes6) private arbitraryBytes6s;

    /** nondeterministic bytes6 value */
    function arbitraryBytes6() internal returns(bytes6) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00310000, 1037618708529) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00310001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00310004, 0) }
        return arbitraryBytes6s[counter++];
    }  
        
    mapping (uint8 => bytes7) private arbitraryBytes7s;

    /** nondeterministic bytes7 value */
    function arbitraryBytes7() internal returns(bytes7) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00320000, 1037618708530) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00320001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00320004, 0) }
        return arbitraryBytes7s[counter++];
    }  
        
    mapping (uint8 => bytes8) private arbitraryBytes8s;

    /** nondeterministic bytes8 value */
    function arbitraryBytes8() internal returns(bytes8) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00330000, 1037618708531) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00330001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00330004, 0) }
        return arbitraryBytes8s[counter++];
    }  
        
    mapping (uint8 => bytes9) private arbitraryBytes9s;

    /** nondeterministic bytes9 value */
    function arbitraryBytes9() internal returns(bytes9) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003e0000, 1037618708542) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003e0004, 0) }
        return arbitraryBytes9s[counter++];
    }  
        
    mapping (uint8 => bytes10) private arbitraryBytes10s;

    /** nondeterministic bytes10 value */
    function arbitraryBytes10() internal returns(bytes10) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00390000, 1037618708537) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00390001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00390004, 0) }
        return arbitraryBytes10s[counter++];
    }  
        
    mapping (uint8 => bytes11) private arbitraryBytes11s;

    /** nondeterministic bytes11 value */
    function arbitraryBytes11() internal returns(bytes11) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003a0000, 1037618708538) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003a0004, 0) }
        return arbitraryBytes11s[counter++];
    }  
        
    mapping (uint8 => bytes12) private arbitraryBytes12s;

    /** nondeterministic bytes12 value */
    function arbitraryBytes12() internal returns(bytes12) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003b0000, 1037618708539) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003b0004, 0) }
        return arbitraryBytes12s[counter++];
    }  
        
    mapping (uint8 => bytes13) private arbitraryBytes13s;

    /** nondeterministic bytes13 value */
    function arbitraryBytes13() internal returns(bytes13) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003c0000, 1037618708540) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003c0004, 0) }
        return arbitraryBytes13s[counter++];
    }  
        
    mapping (uint8 => bytes14) private arbitraryBytes14s;

    /** nondeterministic bytes14 value */
    function arbitraryBytes14() internal returns(bytes14) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003d0000, 1037618708541) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003d0004, 0) }
        return arbitraryBytes14s[counter++];
    }  
        
    mapping (uint8 => bytes15) private arbitraryBytes15s;

    /** nondeterministic bytes15 value */
    function arbitraryBytes15() internal returns(bytes15) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005a0000, 1037618708570) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005a0004, 0) }
        return arbitraryBytes15s[counter++];
    }  
        
    mapping (uint8 => bytes16) private arbitraryBytes16s;

    /** nondeterministic bytes16 value */
    function arbitraryBytes16() internal returns(bytes16) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005b0000, 1037618708571) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005b0004, 0) }
        return arbitraryBytes16s[counter++];
    }  
        
    mapping (uint8 => bytes17) private arbitraryBytes17s;

    /** nondeterministic bytes17 value */
    function arbitraryBytes17() internal returns(bytes17) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005c0000, 1037618708572) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005c0004, 0) }
        return arbitraryBytes17s[counter++];
    }  
        
    mapping (uint8 => bytes18) private arbitraryBytes18s;

    /** nondeterministic bytes18 value */
    function arbitraryBytes18() internal returns(bytes18) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005d0000, 1037618708573) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff005d0004, 0) }
        return arbitraryBytes18s[counter++];
    }  
        
    mapping (uint8 => bytes19) private arbitraryBytes19s;

    /** nondeterministic bytes19 value */
    function arbitraryBytes19() internal returns(bytes19) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240000, 1037618708516) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240004, 0) }
        return arbitraryBytes19s[counter++];
    }  
        
    mapping (uint8 => bytes20) private arbitraryBytes20s;

    /** nondeterministic bytes20 value */
    function arbitraryBytes20() internal returns(bytes20) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250000, 1037618708517) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250004, 0) }
        return arbitraryBytes20s[counter++];
    }  
        
    mapping (uint8 => bytes21) private arbitraryBytes21s;

    /** nondeterministic bytes21 value */
    function arbitraryBytes21() internal returns(bytes21) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260000, 1037618708518) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260004, 0) }
        return arbitraryBytes21s[counter++];
    }  
        
    mapping (uint8 => bytes22) private arbitraryBytes22s;

    /** nondeterministic bytes22 value */
    function arbitraryBytes22() internal returns(bytes22) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270000, 1037618708519) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270004, 0) }
        return arbitraryBytes22s[counter++];
    }  
        
    mapping (uint8 => bytes23) private arbitraryBytes23s;

    /** nondeterministic bytes23 value */
    function arbitraryBytes23() internal returns(bytes23) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280000, 1037618708520) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280004, 0) }
        return arbitraryBytes23s[counter++];
    }  
        
    mapping (uint8 => bytes24) private arbitraryBytes24s;

    /** nondeterministic bytes24 value */
    function arbitraryBytes24() internal returns(bytes24) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290000, 1037618708521) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290004, 0) }
        return arbitraryBytes24s[counter++];
    }  
        
    mapping (uint8 => bytes25) private arbitraryBytes25s;

    /** nondeterministic bytes25 value */
    function arbitraryBytes25() internal returns(bytes25) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0000, 1037618708522) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0004, 0) }
        return arbitraryBytes25s[counter++];
    }  
        
    mapping (uint8 => bytes26) private arbitraryBytes26s;

    /** nondeterministic bytes26 value */
    function arbitraryBytes26() internal returns(bytes26) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0000, 1037618708523) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0004, 0) }
        return arbitraryBytes26s[counter++];
    }  
        
    mapping (uint8 => bytes27) private arbitraryBytes27s;

    /** nondeterministic bytes27 value */
    function arbitraryBytes27() internal returns(bytes27) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002c0000, 1037618708524) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002c0004, 0) }
        return arbitraryBytes27s[counter++];
    }  
        
    mapping (uint8 => bytes28) private arbitraryBytes28s;

    /** nondeterministic bytes28 value */
    function arbitraryBytes28() internal returns(bytes28) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d0000, 1037618708525) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d0004, 0) }
        return arbitraryBytes28s[counter++];
    }  
        
    mapping (uint8 => bytes29) private arbitraryBytes29s;

    /** nondeterministic bytes29 value */
    function arbitraryBytes29() internal returns(bytes29) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00570000, 1037618708567) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00570001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00570004, 0) }
        return arbitraryBytes29s[counter++];
    }  
        
    mapping (uint8 => bytes30) private arbitraryBytes30s;

    /** nondeterministic bytes30 value */
    function arbitraryBytes30() internal returns(bytes30) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00580000, 1037618708568) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00580001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00580004, 0) }
        return arbitraryBytes30s[counter++];
    }  
        
    mapping (uint8 => bytes31) private arbitraryBytes31s;

    /** nondeterministic bytes31 value */
    function arbitraryBytes31() internal returns(bytes31) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00590000, 1037618708569) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00590001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00590004, 0) }
        return arbitraryBytes31s[counter++];
    }  
        
    mapping (uint8 => bytes32) private arbitraryBytes32s;

    /** nondeterministic bytes32 value */
    function arbitraryBytes32() internal returns(bytes32) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00480000, 1037618708552) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00480001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00480004, 0) }
        return arbitraryBytes32s[counter++];
    }  
}
