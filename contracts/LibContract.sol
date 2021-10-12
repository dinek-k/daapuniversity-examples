// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


library Math {
    function divide(uint256 a, uint256 b) internal pure returns(uint256) {
        require(b>0);
        return a/b;
    }
}


contract LibContract {
    
    uint256 public value;
    
    function Calculate(uint256 a, uint256 b) public
    {
        value = Math.divide(a,b);
    }
}