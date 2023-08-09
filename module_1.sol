// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AExample {
    uint256 public balance;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function deposit(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");

        assert(balance + amount >= balance);

        balance += amount;
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(amount > 0, "Amount must be greater than 0");
        require(balance >= amount, "Insufficient balance");

        if (amount > balance / 2) {
            revert("Cannot withdraw more than half of the balance");
        }

        balance -= amount;
    }
}
