// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import {Clones} from "@openzeppelin/contracts/proxy/Clones.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Thing.sol";

contract ThingFactory is Ownable {
    address public libraryAddress;

    address[] public things;

    event ThingCreated(address newThingAddress);

    constructor(address _libraryAddress) {
        libraryAddress = _libraryAddress;
    }

    // function setLibraryAddress(address _libraryAddress) public onlyOwner {
    //     libraryAddress = _libraryAddress;
    // }

    function createThing(string memory _name, uint256 _value) public onlyOwner {
        address clone = Clones.clone(libraryAddress);
        Thing(clone).init(_name, _value);
        things.push(clone);
        ThingCreated(clone);
    }

    function giveThings() public view returns (address[] memory) {
        return things;
    }
}
