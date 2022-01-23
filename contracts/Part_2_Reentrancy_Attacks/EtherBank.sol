// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "hardhat/console.sol";

contract EtherBank is ReentrancyGuard {
    using Address for address payable;

    // keeps track of all savings account balances
    mapping(address => uint) public balances;

    // deposit funds into the sender's account
    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    // withdraw all funds from the user's account
    function withdraw() external nonReentrant {
        require(balances[msg.sender] > 0, "Withdrawl amount exceeds available balance.");
        
        console.log("");
        console.log("EtherBank balance: ", address(this).balance);
        console.log("Attacker balance: ", balances[msg.sender]);
        console.log("");

        payable(msg.sender).sendValue(balances[msg.sender]);
        balances[msg.sender] = 0;
    }

    // check the total balance of the EtherBank contract
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}