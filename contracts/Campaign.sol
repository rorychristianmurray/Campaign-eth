pragma solidity ^0.4.17;

contract Campaign {
    // a struct introduces a new type
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
    }
    
    Request[] public requests;
    address public manager;
    uint public minimumContribution;
    mapping(address => bool) public approvers;

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    
    function Campaign(uint _minimumContribution) public {
        manager = msg.sender;
        minimumContribution = _minimumContribution;
    }
    
    function contribute() public payable {
        require(msg.value > minimumContribution);
        approvers[msg.sender] = true;
    }
    
    function createRequest(string _description, uint _value, address _recipient) 
    public restricted {
        
        require(approvers[msg.sender]);
        
        Request memory newRequest = Request({
            description: _description,
            value: _value,
            recipient: _recipient,
            complete: false
        });
        
        requests.push(newRequest);
            
        }
    
}