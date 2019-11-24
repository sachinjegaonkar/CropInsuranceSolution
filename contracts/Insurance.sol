
pragma solidity ^0.5.8;

import "./ControlledFund.sol";

contract Insurance is ControlledFund {

    modifier onlyOracle {
        require(msg.sender == oracle);
        _;
    }

    enum policyState {Applied, Accepted, Revoked, PaidOut,
                      Expired, Declined, SendFailed}

    event PolicyApplied(
        uint policyId,
        address customer,
        string risk,
        uint premium
    );

    event PolicyAccepted(
        uint policyId
    );

    event PolicyPaidOut(
        uint policyId,
        uint amount
    );

    event PolicyExpired(
        uint policyId
    );

    event PolicyDeclined(
        uint policyId, 
        string reason
    );

    event SendFail(
        uint policyId, 
        string reason
    );
	
    uint minPremium = 50 finney;
    uint maxPremium = 50 ether;
    uint maxPayout  = 500 ether;

    struct policy {

        // 0 - the customer
        address payable customer;
        // 1 - premium
        uint premium;
        // 2 - some description of the risk
        string risk;
        // 3 - probability of default (PD), x 100 (2 Decimal Places; 0.01 == 1)
        uint probability;
        // 4 - the state of the policy
        policyState state;
        // 5 - time of last state change
        uint stateTime;
        // 6 - in case of a claim, we store the description of the claim
        string stateMessage;
        // 7 - calculated payout
        uint calculatedPayout;
		// 8 - actual Payout
        uint actualPayout;
    }

    address public oracle;
	
	uint public balance;

    // Table of policies
    policy[] public policies;
    // Lookup policyIds from customer addresses

    // constructor
    constructor () public {
        owner = msg.sender;
    }

    function getPolicyCount(address _customer) public 
        view returns (uint _count) {
        return policies.length;
    }

    // create new policy
    function newPolicy(string calldata _risk) 
		external
		payable {

        if (msg.value < minPremium || msg.value > maxPremium) {
            emit PolicyDeclined(0, 'Invalid premium value');
            if (!msg.sender.send(msg.value)) {
                emit SendFail(0, 'newPolicy sendback failed (1)');
            }
            return;
        }

		balance += msg.value;
		
        // store or update policy
        uint policyId = policies.length++;
        policy memory p = policies[policyId];

        p.customer = msg.sender;
        // the remaining premium after deducting reserve and reward
        p.premium = msg.value;
        p.risk = _risk;

        // now we have successfully applied
        p.state = policyState.Applied;
        p.stateMessage = 'Policy applied by customer';
        p.stateTime = now;
        emit PolicyApplied(policyId, msg.sender, _risk, p.premium);
    }
    
    function underwrite(uint _policyId, uint _probability, bool _doUnderwrite) 
		external
        onlyOracle { 

		policy memory p = policies[_policyId]; // throws if _policyId invalid
		require(p.state == policyState.Applied);

		p.stateTime = now;
		if (_doUnderwrite) {
			p.probability = _probability; // 1% = 10000
			p.state = policyState.Accepted;
			p.stateMessage = 'Policy underwritten';
			emit PolicyAccepted(
				_policyId 
			);
		} else {
			p.state = policyState.Declined;
			p.stateMessage = 'Policy declined';			
			emit PolicyDeclined(
				_policyId,
				''
			);
		}
    }
    
	function expirePolicy(uint _policyId) public {
        policy memory p = policies[_policyId];
        require(p.state == policyState.Accepted);

		p.state = policyState.Expired;
        p.stateMessage = 'Policy expired';
        p.stateTime = now;
		emit PolicyExpired(_policyId);
	}

    function payOut(uint _policyId, uint _payout, string memory _claim) public 
		// external
        onlyOracle {

        policy memory p = policies[_policyId];
        require(p.state == policyState.Accepted);

        if (_payout == 0) {
            p.state = policyState.Expired;
            p.stateMessage = 'Expired - no payout!';
            p.stateTime = now;
            emit PolicyExpired(_policyId);
        } else {

            p.calculatedPayout = _payout;

            if (_payout> maxPayout) {
                _payout= maxPayout;
            }

            if (_payout> balance) {
                _payout= balance;
            }

            p.actualPayout = _payout;

            if (!p.customer.send(_payout))  {
                p.state = policyState.SendFailed;
                p.stateMessage = 'Payout, send failed!';
                p.actualPayout = 0;
                emit SendFail(_policyId, 'payout sendfail');
            }
            else {
                p.state = policyState.PaidOut;
                p.stateMessage = 'Payout successful!';
                p.stateTime = now;
				balance -= _payout;
                emit PolicyPaidOut(_policyId, _payout);
            }
        }
    }
    
	function setOracle(address _oracle) public 
		onlyOwner {
		oracle = _oracle;
	}
}
