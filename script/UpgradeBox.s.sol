// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {BoxV1} from "../src/BoxV1.sol";

contract UpgradeBox is Script {
    function run() external returns (address) {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);

        vm.startBroadcast();
        BoxV2 newBox = new BoxV2(); // deploy BoxV2
        vm.stopBroadcast();
        address proxy = upgradeBox(mostRecentlyDeployed, address(newBox)); // call the upgradeBox function
        return proxy;
    }

    function upgradeBox(address proxyAddress, address newBox) public returns (address) {
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(proxyAddress); // since BoxV1 is UUPSUpgradeable
        proxy.upgradeTo(address(newBox)); // proxy contract points to newBox
        vm.stopBroadcast();
        return address(proxy);
    }
}
