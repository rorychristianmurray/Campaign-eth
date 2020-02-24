pragma solidity ^0.4.17;

contract Campaign {
    address public manager;
    uint public minimumContribution;
    // address[] public approvers;
    // Request[] public requests
    
    function Campaign(uint _minimumContribution) public {
        manager = msg.sender;
        minimumContribution = _minimumContribution;
    }
    
}