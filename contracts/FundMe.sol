// This contract will:
// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 50;

    function fund() public payable {
        // Contract addresses can hold funds, just like wallets!
        // We need to be able to set a min func amount in USD
        // 1. How do we send ETH to this contract?
        require(msg.value >= minimumUsd, "Didn't send enough!"); // 1e18 == 1 * 10 ** 18 == 1000000000000000000
        // 18 decimals

        // What is reverting?
        // To undo any action from before and send the remaining gas back.
        // The require keyword defines a condition that needs to be met in order for the transaction to go through.
        // Otherwise, the transaction reverts.
    }

    function getPrice() public view returns(uint256) {
        // Requirements (because we are interacting with data outside our project): 
        // ABI 
        // interacting contract Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int price,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        // There are 8 decimal places associated with this price feed, eg:_ 300000000000 = 3000.0
        return uint256(price * 1e10);
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
    
    // function withdraw(){}
}

// video at 4:09:10!!