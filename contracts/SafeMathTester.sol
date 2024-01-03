// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SafeMathTester {
    uint8 public bigNumber = 255; // This is unchecked when before 0.8 version of Solidity
    // However, for gas efficiency purposes, version 0.8 allows devs to use the unchecked keyword to get the same result.

    function add() public  {
        unchecked {bigNumber = bigNumber + 1;}
    }
}