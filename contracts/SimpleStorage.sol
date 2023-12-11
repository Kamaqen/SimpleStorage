// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // This is the way to define the compiler version the IDE will use... The symbol ^ means to use this or any more recent version.

contract SimpleStorage {
    // boolean, uint int, address, bytes
    bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 6; // 256 is the default size for uints, but it is always best to specify!!
    string favoriteNumberInText = "Six";
    int256 favoriteInt = -6;
    address abAddress = 0xF4FaCa935238f1F12ce0E5499a567946b8556A0B;
    bytes32 favoriteBytes = "cat";

}
