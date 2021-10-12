// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./MyERC20Token.sol";

contract CatCoin is MyERC20Token {
    string public symbol;
    address[] public owners;
    uint256 public ownerCount;
    
    constructor(string memory _name, string memory _symbol)
    MyERC20Token(_name)
    {
       symbol = _symbol; 
    }
    
    
    function mint() public virtual override{
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }
    
}