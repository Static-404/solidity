// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SolidityFundamentals1 {
    address public owner;
    uint256 public x = 5;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function add(uint y) view public onlyOwner returns (uint) {
        require(y > x, "y should be larger than x");
        uint256 z = x + y;
        return z;
    }
}