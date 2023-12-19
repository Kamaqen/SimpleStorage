// This contract will:
// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe {
    function fund() public payable {
        // Contract addresses can hold funds, just like wallets!
        // We need to be able to set a min func amount in USD
        // 1. How do we send ETH to this contract?
        require(msg.value > 1e18, "Didn't send enough!"); // 1e18 == 1 * 10 ** 18 == 1000000000000000000

        // What is reverting?
        // To undo any action from before and send the remaining gas back.
        // The require keyword defines a condition that needs to be met in order for the transaction to go through.
        // Otherwise, the transaction reverts.
    }

    function getPrice() {
        // Requirements: 
        // ABI 
        // contract Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
    }

    function getConversionRate(){}

    // function withdraw(){}
}

// video at 4:09:10!!