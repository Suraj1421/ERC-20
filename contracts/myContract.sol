// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CustomToken is ERC20 {

    address public contractOwner;

    constructor(uint256 initialSupply) ERC20("SURAJ", "SRJ") {
        contractOwner = msg.sender;
        _mint(contractOwner, initialSupply);
    }

    // Modifier to restrict access to only the owner
    modifier onlyOwner() {
        require(msg.sender == contractOwner, "You are not the owner");
        _;
    }

    // Function to mint new tokens, only callable by the owner
    function mintTokens(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }

    // Function to burn tokens from the caller's balance
    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }
    
    // Function to transfer tokens from the caller to another address
    function transferTokens(address recipient, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to transfer");
        _transfer(msg.sender, recipient, amount);
    }
}
