// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract Thing is Initializable{
    string public name;
    uint256 public value;

    function init(string memory _name, uint256 _value) public initializer {
        name = _name;
        value = _value;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function setValue(uint256 _value) public {
        value = _value;
    }
}
