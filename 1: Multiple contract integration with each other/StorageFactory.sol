// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public simpleStorageArr;

    function deploySimpleStorageContract() public{
        SimpleStorage simpleStorage=new SimpleStorage();
        simpleStorageArr.push(simpleStorage);
    }

    function sfStore(uint256 ind,uint256 number) public{
        simpleStorageArr[ind].store(number);
    }

    function sfGet(uint256 ind) public view returns(uint256){
        return simpleStorageArr[ind].get();
    }
}