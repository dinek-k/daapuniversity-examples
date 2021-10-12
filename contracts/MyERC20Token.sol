// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyERC20Token {
    string public name;
    mapping(address => uint256) public balance;
    
    constructor(string memory _name)
    {
        name=_name;
    }
    
    function mint() public virtual{
        balance[tx.origin] ++;
    }
}