// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Heist {

    bool public isClassified = true; 
    uint256 public timeOfLoot = block.timestamp; 
    uint8 private heatLevel = 10; 
    uint8 private bounty = 255; 
    uint16 private policeAttention = uint16(block.timestamp); 
    string[3] private stolenData; 

    mapping(uint => uint) internal lootStash; 

    constructor(string[3] memory _loot) public {
        stolenData = _loot;
    }

    function stashLoot(uint key, uint value) internal { 
        lootStash[key] = value;
    }

    event intelDrop(string); 
    function crackSafe(string memory _code) public {
        string memory password = stolenData[2];
        require(keccak256(abi.encodePacked(_code)) == keccak256(abi.encodePacked(password)));
        emit intelDrop(stolenData[1]);
    }
}