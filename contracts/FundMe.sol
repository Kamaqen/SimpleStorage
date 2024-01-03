// This contract will:
// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe {
    uint256 public minimumUsd = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        // Contract addresses can hold funds, just like wallets!
        // We need to be able to set a min func amount in USD
        // 1. How do we send ETH to this contract?
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough!"); // 1e18 == 1 * 10 ** 18 == 1000000000000000000
        // 18 decimals
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;


        // What is reverting?
        // To undo any action from before and send the remaining gas back.
        // The require keyword defines a condition that needs to be met in order for the transaction to go through.
        // Otherwise, the transaction reverts.
    }
    
    // function withdraw(){}
}