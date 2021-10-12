// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Escrow {
    address agent;
    mapping(address => uint256) deposits;
    
     modifier onlyAgent() {
        require(msg.sender == agent, "unauthorized access");
        _;
    }
    
    constructor() public {
        agent = msg.sender; 
    }
    
    
    function deposit(address payee) public payable onlyAgent{
        uint256 amount = msg.value;
        deposits[payee] = deposits[payee] + amount;
    }
    
    function withdraw(address payable payee) public onlyAgent{
        uint256 payment = deposits[payee];
        payee.transfer(payment);
        deposits[payee]=0;
    }
}