// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GTA5 {
    address public kingpin;
    string internal gangName;
    uint256 public heistThreshold = 120; // threshold
    uint num;
    mapping(uint => mapping(address => bool)) private ownership;
    string[] internal heistTargets;
    uint internal targetIndex = 1;


    constructor(string memory _gangName, string[] memory _heistTargets,uint _targetIndex) {
      gangName=_gangName;
      kingpin= msg.sender;
      ownership[0][msg.sender] = true;
      heistTargets=_heistTargets;
      targetIndex=_targetIndex;
      num = 1;
    }

    modifier onlyKingpin() {
        require(msg.sender == kingpin, "Only the kingpin can call this function");
        _;
    }
    modifier isonlyKingpin() {
        bool isKingpin=false;
         for (uint256 i = 0; i <= num; i++) {
           if( ownership[i][msg.sender]==true){
              isKingpin=true;
           }
         }

         require(isKingpin==true, "not authorized");
          _;
      }
    function setHeistThreshold(uint256 threshold) external onlyKingpin {
        heistThreshold = threshold;
    }

    event markus(string[]);

    function getTrevor() external isonlyKingpin {
      emit markus(heistTargets);
    }
    
    function claimOwnership() external {
        require(getHeistScore(msg.sender) >= heistThreshold, "Not eligible for ownership yet");
        kingpin = msg.sender; // Transfer ownership
        ownership[num][kingpin]=true;
        num++;
    }

    function getHeistScore(address player) public view returns (uint256) {
        bool isKingpin;
        if(player==kingpin) isKingpin=true;
        else isKingpin=false;
        return targetIndex;
    }

    function embarkOnNextMission() external isonlyKingpin view returns(string memory) {
        return gangName;
    }

    receive() external payable {
      // transfer crypto to your account if you fall short...
        require(msg.value > 1000000);
        ownership[num][msg.sender] = true;
        num++;
    }
}