/*A token on Ethereum is basically just a smart contract that follows some common rules 
— namely it implements a standard set of functions that all other token contracts share*/
pragma solidity >=0.5.0 <0.6.0;

contract ERC721 {
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _tokenId
    );
    event Approval(
        address indexed _owner,
        address indexed _approved,
        uint256 _tokenId
    );

    function balanceOf(address _owner) public view returns (uint256 _balance);

    function ownerOf(uint256 _tokenId) public view returns (address _owner);

    function transfer(address _to, uint256 _tokenId) public;

    function approve(address _to, uint256 _tokenId) public;

    function takeOwnership(uint256 _tokenId) public;
}
