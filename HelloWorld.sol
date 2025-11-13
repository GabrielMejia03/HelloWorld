// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

contract Holamundo {
    mapping(address => string) private names;
    mapping(address => address) private nameOwners;  // <-- Add this

    modifier onlyNameOwner() {
        require(
            nameOwners[msg.sender] != address(0),
            "Solo el dueno puede modificar"
        );
        _;
    }

    function GuardarNombre(string memory _name) external {
        names[msg.sender] = _name;
        nameOwners[msg.sender] = msg.sender;  // <-- Track the owner
    }

    function Saludo() external onlyNameOwner view returns (string memory) {
        require(
            bytes(names[msg.sender]).length > 0,
            "No hay ningun nombre"
        );
        return string(abi.encodePacked("Saludos, ", names[msg.sender], "!"));
    }
}
