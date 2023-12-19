// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

interface Counter {
    function getNumber() external returns (uint256);
    function setNumber(uint256 newNumber) external;
    function increment() external;
}


contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = Counter(HuffDeployer.deploy("Counter"));
    }

    /// @dev Ensure that you can set and get the value.
    function testSetAndGetNumber(uint256 value) public {
        counter.setNumber(value);
        console.log(value);
        console.log(counter.getNumber());
        assertEq(value, counter.getNumber());
    }

    function testIncrement() public {
        counter.setNumber(0);
        counter.increment();
        assertEq(counter.getNumber(), 1);
    }
}


