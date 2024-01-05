// This contract will:
// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

// constant, immutable

// current gas cost(without tweaks) 756,839
// cost with constant minimumusd 736,882

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;
    // 347 - constant
    // 2446 - without constant

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    // It's necessary to set this contract to only withdraw to the deployer.
    
    address public immutable i_owner; // This variable is assigned ONE TIME, just like minusd, but NOT in the same line.
    // That's why we can use immutable keyword. -- no immutable cost: 2552 -- immutable: 439

    // For efficiency purposes, a constructor is better than another function.

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        // Contract addresses can hold funds, just like wallets!
        // We need to be able to set a min func amount in USD
        // 1. How do we send ETH to this contract?
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough!"); // 1e18 == 1 * 10 ** 18 == 1000000000000000000
        // 18 decimals
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;


        // What is reverting?
        // To undo any action from before and send the remaining gas back.
        // The require keyword defines a condition that needs to be met in order for the transaction to go through.
        // Otherwise, the transaction reverts.
    }
    
    function withdraw() public onlyOwner {
        /* starting index, ending logic, step amount */
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            // code
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // resetting the array
        funders = new address[](0);

        // actually withdraw the funds

        // transfer
        /* payable(msg.sender).transfer(address(this).balance); */
        //send
        /* bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed."); */
        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed.");
    }

    // Modifiers make it possible to add a code block to a function just by including a keyword in the function declaration.
    // This way, we don't need to copy paste the whole line of code every time we need to use that requirement in a function.
    // The underscore ("_") signals the place where the function's contents should be placed for execution.

    modifier onlyOwner {
        // require(msg.sender == i_owner, "Sender is not owner!");
        // the following is a more gas efficient way of reverting a transaction:
        // btw: it's more gas efficient because there is no need to store a long string.
        if (msg.sender != i_owner) { revert NotOwner(); }
        _;
    }
}