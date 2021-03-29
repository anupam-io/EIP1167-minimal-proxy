// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Thing {
    string public name;
    uint256 public value;

    bool onlyOnce = false;

    function init(string memory _name, uint256 _value) public {
        require(!onlyOnce, "Can be called only once.");
        onlyOnce = true;
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
