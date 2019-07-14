pragma solidity ^0.5.6;

contract BadToken {
    uint num;

    function transfer(address to, uint amt) public {
        num++;  // avoids annoying mutability warnings
    }
}

contract GoodToken {
    uint num;

    function transfer(address to, uint amt) public returns (bool) {
        num++;  // avoids annoying mutability warnings
        return true;
    }
}
