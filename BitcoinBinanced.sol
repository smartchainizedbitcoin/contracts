// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/ownership/Ownable.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Capped.sol";

contract BitcoinBinanced is ERC20, ERC20Detailed, ERC20Capped, Ownable {
	using SafeERC20 for ERC20;

    constructor (address farmAdd) public 
    ERC20Detailed ("Bitcoin Binanced", "BTCB", 18)
    ERC20Capped (21000000 * 10 ** 18)
    {
        _mint(_msgSender(), 13125000 * 10 ** 18);
        _mint(address(this), 7875000 * 10 ** 18);
        _approve(address(this), farmAdd, 7875000 * 10 ** 18);
    }

}