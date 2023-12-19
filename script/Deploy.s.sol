// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Script.sol";

interface Counter {
  function getNumber() external returns (uint256);
  function setNumber(uint256 newNumber) external;
  function increment() external;
}

contract Deploy is Script {
  function run() public returns (Counter counter) {
    counter = Counter(HuffDeployer.deploy("Counter"));
  }
}
