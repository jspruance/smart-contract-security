// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract RealEstateAgreement {
    address private owner;
    uint256 public price;
    bool public sellerPaysClosingFees;
 
    constructor(uint256 _price) {
        owner = msg.sender;
        price = _price;
        sellerPaysClosingFees = false;
    }

    function setPrice(uint256 _price) public onlyOwner {
        price = _price;
    }

    function setClosingFeeAgreement(bool _ownerPays) public onlyOwner {
        sellerPaysClosingFees = _ownerPays;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Only the owner can update agreement terms.");
        _;
    }

}