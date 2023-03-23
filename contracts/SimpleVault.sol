// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SimpleVault {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // Modifier to check if the caller is the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Function to deposit Ether into the contract (onlyOwner added)
    function deposit() external payable onlyOwner {
        require(msg.value > 0, "You must send some Ether to deposit");
    }

    // Function to withdraw a specified amount of Ether
    function withdraw(uint256 amount) external onlyOwner {
        require(address(this).balance >= amount, "Not enough Ether in the vault");
        owner.transfer(amount);
    }

    // Function to check the balance of the contract
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}