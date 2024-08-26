// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract CustomToken {

    // Public variables for storing token details
    string public tokenName = "Kitty";
    string public tokenSymbol = "KTY";
    uint256 public totalSupply;

    // Mapping to store balances of addresses
    mapping(address => uint256) public balances;

    // Function to mint new tokens
    function mint(address recipient, uint256 amount) public {
        totalSupply += amount;
        balances[recipient] += amount;
    }

    // Function to burn tokens from a specific address
    function burn(address account, uint256 amount) public {
        require(balances[account] >= amount, "Insufficient balance to burn");
        totalSupply -= amount;
        balances[account] -= amount;
    }
}
