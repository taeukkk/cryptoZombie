pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);
    /* Events are a way for your contract to communicate that something happened on the blockchain to your app front-end, 
    which can be 'listening' for certain events and take action when they happen. */

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies; //dynamic array

    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) -1;
		emit NewZombie(id,_name,_dna);
    }

    /* The view functions are read-only function,
    which ensures that state variables cannot be modified after calling them. 
    The pure functions do not read or modify the state variables, 
    which returns the values only using the parameters passed to the function or local variables present in it. */

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        /* keccak256 expects a single parameter of type bytes. 
        we have to pack any parameters before calling keccak256. */
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}