// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock {
    uint public unlockTime;
    address payable public owner;

    event Withdrawal(uint amount, uint when);

    error timeLockInThePast();
    error lockTimeNotElapsedYet();
    error notOwner();

    /**
     * @notice constructor
     * @param _unlockTime unlock time for this contract
     */
    constructor(uint _unlockTime) payable {
        // require(
        //     block.timestamp < _unlockTime,
        //     "Unlock time should be in the future"
        // );
        if (block.timestamp >= _unlockTime) revert timeLockInThePast();

        unlockTime = _unlockTime;
        owner = payable(msg.sender);
    }

    /**
     * @notice allow owner to whitdraw funds after time lock elapsed
     */
    function withdraw() public {
        // Uncomment this line, and the import of "hardhat/console.sol", to print a log in your terminal
        // console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);

        if (block.timestamp < unlockTime) revert lockTimeNotElapsedYet();

        if (msg.sender != owner) revert notOwner();

        emit Withdrawal(address(this).balance, block.timestamp);

        owner.transfer(address(this).balance);
    }
}
