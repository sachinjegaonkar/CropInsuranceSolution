pragma solidity ^0.5.8;

import "./owned.sol";

contract ControlledFund is owned {

    /**
     * Restrict function call to riskManager.
     */
    modifier onlyRiskManager() {
        require(msg.sender == riskManager);
        _;
    }

    /**
     * Restrict function call to funder.
     */
    modifier onlyFunder() {
        require(msg.sender == owner);
        _;
    }

	address public riskManager;
	address public funder;
	
	ControlledFund pool;
	
	uint public fundingBalance;
	
	function setup(address _riskManager, address _funder) public 
		onlyOwner {
		riskManager = _riskManager;
		funder = _funder;
		pool = ControlledFund(funder);
	}
	
	function send_Funds(uint _amount) public 
		onlyRiskManager {
		fundingBalance -= _amount;
		pool.receive_Funds.value(_amount)();
	
	}

	function receive_Funds() public 
		onlyFunder
		payable {
		fundingBalance += msg.value;
		
	}
}
