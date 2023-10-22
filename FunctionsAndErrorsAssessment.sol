// SPDX-License-Identifier: MIT

// This project is a modification of the code from previous Solidity Assessment
// that adds require, revert, and assert statements.
// https://github.com/CoolUsername99/SolidityAssessment

pragma solidity 0.8.18;

contract MyToken {
    string public name = "NamedToken";
    string public abbrv = "NT";
    uint public supply = 0;
    mapping (address => uint) public balances;

    function mint (address addr, uint value) public {
        // requires the value parameter to be less than or equal to 100
        require(value <= 100, "Maximum mint value is 100.");

        supply += value;
        balances[addr] += value;

        // check if supply and address balance is equal (should never be not equal)
        assert(supply == balances[addr]);
    }

    function burn (address addr, uint value) public {
        if (balances[addr] < value) {
            // revert if address balannce less than burn value
            revert("Insufficient balance for the given burn value");
        }

        supply -= value;
        balances[addr] -= value;

        // check if supply and address balance is equal (should never be not equal)
        assert(supply == balances[addr]);
    }

}