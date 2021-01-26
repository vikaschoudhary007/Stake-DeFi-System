pragma solidity >=0.4.17 <0.8.0;

import "./MDT_Token.sol";

contract StakePool{

    string public name = "Stake Pool System";

    MdtToken public mdtToken;


    address public owner = msg.sender;

    mapping (address => uint) public stakingBalance;
    mapping (address => mapping (uint => uint)) public stakeTime;
	mapping (address => bool) public hasStaked;
	mapping (address => bool) public isStaking;

	address[] public stakers;

	constructor(MdtToken _mdtToken) public{

		mdtToken = _mdtToken;

	}

	function stakeTokens(uint256 _amount) public {

		require (_amount > 0 , 'Amount cannot be 0!');
  	
  		// Transfer MDT Tokens to this  contract for staking
		mdtToken.transferFrom(msg.sender, address(this), _amount) ;

  		// Update staking balance and staking time
		stakingBalance[msg.sender] += _amount;
		stakeTime[msg.sender][_amount] = now;


  		// Add stakers to the stakers array *ONLY* if they haven't staked already
  		if (!hasStaked[msg.sender]) {
  			stakers.push(msg.sender);
  		}

  		hasStaked[msg.sender] = true;
  		isStaking[msg.sender] = true;
  
	}
	

	function mintRewards() public {

		
		
	}

	function calculateRewards() public {


	}
	
	function unstakeTokens(uint256 _amount) public{

	}



}