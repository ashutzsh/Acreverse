//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/Counters.sol"; // From openzeppelin docs
import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; // From openzeppelin docs
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol"; // From openzeppelin docs

contract RealEstate is ERC721URIStorage { // From openzeppelin docs
    using Counters for Counters.Counter; // From openzeppelin docs
    Counters.Counter private _tokenIds; // From openzeppelin docs

    constructor() ERC721("Real Estate", "REAL") {} // From openzeppelin docs

    function mint(string memory tokenURI) public returns (uint256) { //To mint NFTs
    //string memory tokenURI: this is the metadata
        _tokenIds.increment(); //Starts from 0

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId); //Minting function present in openzepplin contract
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function totalSupply() public view returns (uint256) { //To see how many NFTs have been currently minted
        return _tokenIds.current();
    }
}
