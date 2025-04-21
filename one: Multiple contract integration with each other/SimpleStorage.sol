// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    uint256 public number;

    function store(uint256 _number) public{
        number = _number;
    }

    function get() public view returns(uint256){
        return number;
    }
}