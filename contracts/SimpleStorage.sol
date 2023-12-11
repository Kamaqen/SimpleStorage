// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // This is the way to define the compiler version the IDE will use... The symbol ^ means to use this or any more recent version.

contract SimpleStorage {
    // boolean, uint int, address, bytes
    bool hasFavoriteNumber = true;
    // This 'public' sentence on line 9 is making favoriteNumber a "function" that returns the current value
    // Also: this value defaults to 'internal' which means this is only readable by the SimpleStorage function.
    uint256 public favoriteNumber; // 256 is the default size for uints, but it is always best to specify!!
    string favoriteNumberInText = "Six";
    int256 favoriteInt = -6;
    address abAddress = 0xF4FaCa935238f1F12ce0E5499a567946b8556A0B;
    bytes32 favoriteBytes = "cat"; // bytes with no size means it accepts any size but also best to specify... More on bytes coming soon!
    // Zero values: unsigned integers get a default value of 0, eg: uint256 favoriteNumber --> then favoriteNumber is assigned 0

    function store(uint256 _favoriteNumber) public  {
        favoriteNumber = _favoriteNumber;
    }
}
