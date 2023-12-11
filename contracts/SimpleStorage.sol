// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // This is the way to define the compiler version the IDE will use... The symbol ^ means to use this or any more recent version.

contract SimpleStorage {
    // boolean, uint int, address, bytes
    // bool hasFavoriteNumber = true;
    // This 'public' sentence on line 9 is making favoriteNumber visible; this variable is also a "function" that returns the current value
    // Also: if not specified, this visibility value defaults to 'internal' which means this is only readable by the SimpleStorage function.
    uint256 favoriteNumber; // 256 is the default size for uints, but it is always best to specify!!
    // string favoriteNumberInText = "Six";
    // int256 favoriteInt = -6;
    // address abAddress = 0xF4FaCa935238f1F12ce0E5499a567946b8556A0B;
    // bytes32 favoriteBytes = "cat"; // bytes with no size means it accepts any size but also best to specify... More on bytes coming soon!
    // Zero values: unsigned integers get a default value of 0, eg: uint256 favoriteNumber --> then favoriteNumber is assigned 0

    // People public person = People({favoriteNumber: 2, name: "Patrick"});

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // uint256[] public favoriteNumbersList;

    // When creating arrays, it is possible to specify the number of elements of the array inside the brackets eg: [32], making it a fixed size array
    // The array below is called a dynamic array, because the length can vary.
    People[] public people;

    function store(uint256 _favoriteNumber) public  {
        favoriteNumber = _favoriteNumber;
        // uint256 testVar = 5;
    }

    // The view and pure functions don't allow reading or writing to or from the blockchain, so they don't involve a cost
    // However, if these functions are called inside a function that costs gas, then it would not be free.
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    /* 
    function add() public pure returns(uint256) {
        return (1 + 1);
    }
    */

    // These are two ways of creating a function that pushes new people based on the arguments given to the People array.
    /* this is one way:
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        people.push(newPerson);
    }
    and next comes the other way:
    */
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
    }

    
}