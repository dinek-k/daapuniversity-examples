// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract TimeLockSaving {
    
    address payable beneficiary;
    uint256 public releaseTime;
    
    constructor(address payable _beneficiary, uint256 _releaseTime) public payable{
        require(_releaseTime> block.timestamp, "Invalid Release Time");
        beneficiary=_beneficiary;
        releaseTime = _releaseTime;
    }
    
    
    function release() public {
        require(block.timestamp > releaseTime);
        beneficiary.transfer(address(this).balance);
    }
    
}