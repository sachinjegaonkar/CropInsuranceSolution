pragma solidity ^0.5.8;

import "./Insurance.sol";

contract RiskManager {

	address public owner;
	Insurance insurance;
	
    modifier onlyOwner() {
        if (msg.sender != owner) {
            // Only owner is allowed to proceed
            throw;
        }
        _;
    }
	
	function RiskManager() {
		owner = msg.sender;
	}
	
	function fund_insurance(uint _amount) 
		onlyOwner 
		external {
	}
	
	function defund_insurance(uint _amount) 
		onlyOwner 
		external {

		insurance.send_Funds(_amount);
		
	}
	
	function setNewTotalSupply(uint _amount)
		onlyOwner {
	}
		
	function setContracts(address _insurance_address)
		onlyOwner
		external {
		insurance = Insurance(_insurance_address);
	}
}