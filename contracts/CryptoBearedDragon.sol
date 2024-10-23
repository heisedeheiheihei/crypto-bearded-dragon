// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract CryptoBeardedDragon is ERC721 {
    uint256 public _tokenId = 1;

    address public _owner;

    struct BeardedDragon {
        uint256 genes;
        uint256 birthTime;
        uint256 momId;
        uint256 dadId;
        uint256 generation;
    }

    mapping(uint256 => BeardedDragon) public BeardedDragonMapping;

    constructor() ERC721("CryptoBeardedDragon", "CBD") {
        _owner = msg.sender;
    }

    // create the first generation beared dragon
    function createBeardedDragonFirstGeneration() public returns(uint256){
        require(msg.sender == _owner, "only creator can create first generation");
        require(_tokenId <= 2, "first generation can only be created 2 times");

        uint256 genes = createGenes(_tokenId, 0, 0, 0);

        return _createBeardedDragon(genes, 0, 0, 0, msg.sender);
    }

    // create the beared dragon
    function _createBeardedDragon(
        uint256 genes,
        uint256 modId,
        uint256 dadId,
        uint256 generation,
        address owner
    ) private returns(uint256){
        BeardedDragonMapping[_tokenId] = BeardedDragon(genes, block.timestamp, modId, dadId, generation);
        _mint(owner, _tokenId);
        return _tokenId++;
    }

    // breed beared dragons, there may be more than one
    function breed(uint256 momId, uint256 dadId) public {
        require(momId != dadId, "modId must not be equal to dadId");
        require(momId > 0, "modId and dadId must not be equal to 0");
        require(dadId > 0, "modId and dadId must not be equal to 0");

        BeardedDragon memory momBD = BeardedDragonMapping[momId];
        BeardedDragon memory dadBD = BeardedDragonMapping[dadId];

        // mom and dad dragon must be existed
        _requireOwned(momId);
        _requireOwned(dadId);

        // owner check
        require(_ownerOf(momId) == msg.sender, "you are not the owner");
        require(_ownerOf(dadId) == msg.sender, "you are not the owner");

        uint256 newGeneration = ((momBD.generation >= dadBD.generation) ? momBD.generation : dadBD.generation) + 1;

        // get a random number between 0 to 10, which is the number of baby dragons
        uint randomNum = getRandomNum(10);

        for (uint8 i = 0; i < randomNum; i++) {
            uint256 newGenes = createGenes(_tokenId, momBD.genes, dadBD.genes, i);

            _createBeardedDragon(newGenes, momId, dadId, newGeneration, msg.sender);
        }

        // return _createBeardedDragon(newGenes, momId, dadId, newGeneration, msg.sender);
    }

    function createGenes(uint256 tokenId, uint256 momGenes, uint256 dadGenes, uint8 curNum) private view returns(uint256) {
        return uint256(keccak256(abi.encodePacked(msg.sender, block.timestamp, tokenId, momGenes, dadGenes, curNum)));
    }

    function transfer(address to, uint256 tokenId) external {
        _requireOwned(tokenId);

        require(_ownerOf(tokenId) == msg.sender, "you are not the owner");

        // BeardedDragon storage _beardedDragon = BeardedDragonMapping[tokenId];

        _transfer(msg.sender, to, tokenId);
    }

    // get a random number
    function getRandomNum(uint number) private view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % number;
    }

}