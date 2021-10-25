// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Ownable {
    address public owner;

    event OwnershipTransferred(address newOwner);

    constructor() {
        owner = msg.sender;
    }

    modifier restrictToOwner() {
        require(msg.sender == owner, "This action can only be performed by the owner of the contract.");
        _;
    }

    function transferOwnership(address payable newOwner) restrictToOwner public {
        owner = newOwner;
        emit OwnershipTransferred(owner);
    }
}