# metacrafters3-3
Here's a `README.md` file for your Solidity contract:

```markdown
# Jagan Token Smart Contract

This is a Solidity smart contract for the "Jagan" token. The contract implements basic functionalities for a token such as minting, burning, and transferring tokens. The contract is designed to be owned by a single address which has special permissions for minting tokens.

## Contract Details

### Owner

- **owner**: The address of the contract owner who has special permissions to mint new tokens.

### Token Information

- **tokenName**: The name of the token ("Jagan").
- **tokenSymbol**: The symbol of the token ("Vs").
- **totalSupply**: The total supply of the token.

### Balances

- **balances**: A mapping of addresses to their token balances.

## Functions

### constructor

The constructor initializes the contract and sets the `msg.sender` as the owner. It also sets the token name, symbol, and initializes the total supply to 0.

```solidity
constructor() {
    owner = msg.sender;
    tokenName = "Jagan";
    tokenSymbol = "Vs";
    totalSupply = 0;
}
```

### mint

Mints new tokens and adds them to the total supply and the balance of the specified address. Only the contract owner can call this function.

```solidity
function mint(address _address, uint256 _value) public onlyOwner {
    require(_address == owner, "Only the contract owner can mint tokens");
    totalSupply += _value; 
    balances[_address] += _value;
}
```

### burn

Burns tokens from the specified address, reducing the total supply. Any user can call this function to burn tokens from their balance.

```solidity
function burn(address _address, uint256 _value) public {
    if (balances[_address] >= _value) {
        totalSupply -= _value; 
        balances[_address] -= _value;
    }
}
```

### transfer

Transfers tokens from one address to another. The sender must have a balance equal to or greater than the value to be transferred.

```solidity
function transfer(address _from, address _to, uint256 value) public {
    if (balances[_from] >= value) {
        balances[_from] -= value;
        balances[_to] += value;
    }
}
```

## Modifiers

### onlyOwner

The `onlyOwner` modifier restricts access to certain functions, ensuring that only the contract owner can call them.

```solidity
modifier onlyOwner() {
    require(msg.sender == owner, "Only the contract owner can perform this action");
    _;
}
```
