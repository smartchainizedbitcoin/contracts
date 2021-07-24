// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../node_modules/@openzeppelin/contracts/ownership/Ownable.sol";
import "../node_modules/@openzeppelin/contracts/math/SafeMath.sol";
import "../node_modules/@openzeppelin/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "../node_modules/@openzeppelin/contracts/crowdsale/validation/CappedCrowdsale.sol";

contract BitcoinBinancedCrowdsale is TimedCrowdsale, CappedCrowdsale, Ownable {
	using SafeMath for uint256;

    // The block number when ICO starts
    uint256 public startBlock = 11407000;

    // The block number when ICO ends
    uint256 public endBlock = 12300000;

	constructor (
		uint256 rate,
		address payable wallet,
		IERC20 token,
		uint256 openingBlock,
		uint256 closingBlock
	) public 
	Crowdsale(rate, wallet, token)
	TimedCrowdsale(openingBlock, closingBlock)
	CappedCrowdsale(8400000000000000000000) {//max 8400 BNB
	}

	function buyBTCB() public payable {
		buyTokens(_msgSender());
	}

	function recoverTokens() onlyOwner external {
		require(hasClosed(), "Function to recover tokens AFTER THE END of crowdsale only");
		token().transfer(wallet(), token().balanceOf(address(this)));
	}

	//start : 10543100
	//end : 11407130
}