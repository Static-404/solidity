
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract SolidityFundamentals2 {
    enum State {
        IN_PROGRESS,
        ENDED
    }

    address payable public owner;

    State public currentState;

    constructor() {
        owner = payable (msg.sender);
    }

    modifier stillInProgress(){
        require(currentState == State.IN_PROGRESS, "donation phase is no longer in progress");
        _;
    }

    function donate() external payable stillInProgress() {
    }

    function checkAmountCollected() public view stillInProgress() returns (uint) {
        return address(this).balance;
    }

    function withdraw() external  {
        require(msg.sender == owner, "only the owner can withdraw");
        //i can also use a tranfer function but it isnt adviced anymore
        // owner.transfer(address(this).balance);
        (bool sent, bytes memory data) = owner.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
        currentState == State.ENDED;
    }

}
