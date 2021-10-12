// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./MyERC20Token.sol";

contract SampleToken {
    
    address payable wallet;
    address token;
    
    event Purchase(address indexed _buyer, uint256 _tokensBought);
    
    constructor(address payable _wallet, address _token)
    {
        wallet=_wallet;
        token = _token;
    }
    
    
    function buyToken() public payable{
        MyERC20Token _token = MyERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
    
}