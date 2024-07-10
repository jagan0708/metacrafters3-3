# Jagan Token Contract

## Overview

The `Jagan` smart contract is an ERC20 token implementation on the Ethereum blockchain. It utilizes OpenZeppelin's ERC20 standard contract and includes additional functionality for minting, burning, and transferring tokens.

## Features

- **ERC20 Standard:** Inherits from OpenZeppelin's ERC20 contract.
- **Minting:** The owner can mint new tokens.
- **Burning:** Any user can burn their tokens.
- **Transfer:** Tokens can be transferred from one address to another.
- **Ownership:** Only the owner has the authority to mint tokens.

## Prerequisites

- Solidity `^0.8.18`
- OpenZeppelin Contracts

## Installation

1. Install OpenZeppelin Contracts:
   ```bash
   npm install @openzeppelin/contracts
   ```

## Contract Details

### State Variables

- `owner`: The address of the contract owner.
- `tokenName`: The name of the token ("Sai").
- `tokenSymbol`: The symbol of the token ("Vs").
- `balances`: A mapping that tracks the token balances of each address.

### Modifiers

- `onlyOwner`: Restricts access to functions to only the contract owner.

### Constructor

```solidity
constructor() ERC20("sai", "vs") {
    owner = msg.sender;
    tokenName = "Sai";
    tokenSymbol = "Vs";
}
```

Initializes the contract with the token name "Sai" and symbol "Vs". Sets the deployer as the contract owner.

### Functions

- `mint(address _address, uint256 _value)`: Mints `_value` tokens to `_address`. Only the owner can call this function.

- `burn(address _address, uint256 _value)`: Burns `_value` tokens from `_address` if the balance is sufficient.

- `transfer(address _from, address _to, uint256 value)`: Transfers `value` tokens from `_from` to `_to` if the balance is sufficient.

## Usage

### Minting Tokens

Only the owner can mint new tokens.

```solidity
function mint(address _address, uint256 _value) public onlyOwner
```

Example:

```solidity
jagan.mint(ownerAddress, 1000);
```

### Burning Tokens

Any user can burn their tokens if they have a sufficient balance.

```solidity
function burn(address _address, uint256 _value) public
```

Example:

```solidity
jagan.burn(userAddress, 500);
```

### Transferring Tokens

Tokens can be transferred from one address to another.

```solidity
function transfer(address _from, address _to, uint256 value) public
```

Example:

```solidity
jagan.transfer(fromAddress, toAddress, 200);
```

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

Feel free to customize the README further to suit your specific needs and project details!
