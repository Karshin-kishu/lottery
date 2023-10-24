// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Lottery {
    address public manager;
    address payable[] public participants;

    constructor() {
        manager = msg.sender;
    }

    
    receive() external payable {
        require(msg.value == 1 ether, "Invalid bet amount"); 
        participants.push(payable(msg.sender));
    }

    // Function to get the contract balance
    function getBalance() public view returns (uint) {
        require(
            msg.sender == manager,
            "Only the manager can check the balance"
        ); 
        return address(this).balance;
    }
    function random(uint256 range) private view returns (uint256) {
        uint256 randomNumber = uint256(
            keccak256(
                abi.encodePacked(
                    participants.length
                )
            )
        );
        return randomNumber % range;
    }
    function selectWinner() public {
        require(msg.sender == manager, "Only the manager can select a winner");
        require(
            participants.length >= 3,
            "Not enough participants to select a winner"
        );

        uint r = random(100);

        uint index = r % participants.length;
        address payable winner = participants[index];

        (bool success, ) = winner.call{value: getBalance(), gas: gasleft()}("");
        require(success, "Failed to send the balance to the winner");
        delete participants;
    }
}
