

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Jagan is ERC20
 {
    address public owner;
    string public tokenName;
    string public tokenSymbol;
    

    mapping(address => uint256) public balances;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    constructor() ERC20("sai","vs") {
        owner = msg.sender;
        tokenName = "Sai";
        tokenSymbol = "Vs";
        
    }

   function mint(address _address, uint256 _value) public onlyOwner{
        require(_address == owner, "Only the contract owner can mint tokens");
        
        balances[_address] += _value;
    }


   function burn(address _address, uint256 _value) public {
        if (balances[_address] >= _value) {
            
            balances[_address] -= _value;
        }
    }

   function transfer( address _from,address _to,uint256 value) public {
        if (balances[_from] >= value) {
            balances[_from] -= value;
            balances[_to] += value;
        }
    }
}
