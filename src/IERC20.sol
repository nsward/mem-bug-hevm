pragma solidity ^0.5.6;

contract IERC20 {
    function transfer(address dst, uint amt) public returns (bool success);
}
