// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    uint256 public number;

    // if you want a function to be overridden you have to declare it virtual.
    function store(uint256 _number) public virtual{
        number = _number;
    }

    function get() public view returns(uint256){
        return number;
    }
}