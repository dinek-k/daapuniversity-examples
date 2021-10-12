// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CustomModifier {
    
    mapping(uint => Person) public MyPeople;
    uint public count =0;
    address _owner;
    uint256 _openingTime = 1633891850;
    
    modifier onlyOwner() {
        require(msg.sender == _owner, "unauthorized access");
        _;
    }
    
    modifier onlyWhenOpen() {
        require(block.timestamp>_openingTime, "Not Open");
        _;
    }
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    
    
    constructor() public{
        _owner=msg.sender;
    }
    
    
    
    function AddPerson(string memory _fName, string memory _lname) public onlyOwner onlyWhenOpen {
        count++;
        MyPeople[count] = Person(count,_fName,_lname);
    }
    
    
}