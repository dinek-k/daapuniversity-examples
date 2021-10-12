// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyContract {
    
    string public value;
    bool public myBool;
    int public myInt;
    enum State { Active, Starting, Stopped, Waiting}
    State public state;
    Person[] public People;
    mapping(uint => Person) public MyPeople;
    uint public count =0;
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    
    constructor() public {
        value="my-first-value";
        myBool = false;
        myInt=1;
        state=State.Waiting;
    }
    
    
    
    function set(string memory _value) public {
        value=_value;
    }
    
    function set(bool  _value) public {
        myBool=_value;
    }
    
    function set(int  _value) public {
        myInt=_value;
    }
    
    function Activate() public {
        state = State.Active;
    }
    
    function IsActive() public view returns (bool) {
        return state==State.Active;
    }
    
    function AddPerson(string memory _fName, string memory _lname) public {
        //People.push(Person(_fName,_lname));
        count++;
        MyPeople[count] = Person(count,_fName,_lname);
    }
    
    
}