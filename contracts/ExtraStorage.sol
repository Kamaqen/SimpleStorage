// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    // add 5 to any given number
    // It's possible to override inherited functions
    // keywords: virtual, override 
    function store(uint256 _favoriteNumber) override public {
        favoriteNumber = _favoriteNumber + 5;
    }
}