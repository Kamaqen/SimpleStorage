// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public  {
        // Address -- We need this and also the ABI in order to interact with a contract.
        // ABI: Application Binary Interface
        SimpleStorage(simpleStorageArray[_simpleStorageIndex]).store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
       return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}