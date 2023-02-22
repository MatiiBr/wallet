// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
import "@openzeppelin/contracts/access/Ownable.sol";
/* The EventTickets contract keeps track of the details and ticket sales of one event. */

contract Wallet is Ownable {
     event LogWhitdrawTo(address from, address to);

    receive() external payable {}

    function withdrawAll() external onlyOwner{
        payable(owner()).transfer(address(this).balance);
    }

    function withdraw(uint256 _amount) external onlyOwner{
        require(address(this).balance >= _amount,"Fondos insuficientes");
        payable(owner()).transfer(_amount);
    }

    function withdrawToWallet(address _wallet, uint256 _amount) external onlyOwner{
        require(address(this).balance >= _amount,"Fondos insuficientes");
        payable(_wallet).transfer(_amount);
        emit LogWhitdrawTo(address(this), _wallet);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
