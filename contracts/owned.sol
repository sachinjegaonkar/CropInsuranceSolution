
pragma solidity ^0.5.8;

contract owned {

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
	
	address public owner;
	
	function setOwner(address _newOwner) public 
		onlyOwner {
		owner = _newOwner;	
	}
}