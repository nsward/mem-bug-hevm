pragma solidity ^0.5.6;

import "ds-test/test.sol";

import "./BrokenErc20.sol";

contract BrokenErc20Test is DSTest {
    BrokenErc20 erc;

    function setUp() public {
        erc = new BrokenErc20();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
