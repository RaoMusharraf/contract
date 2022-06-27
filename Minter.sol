// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";

contract newNFT is NFTokenMetadata, Ownable {

    uint256 total_user;
    mapping(address => uint256) public Total_Wallet;
    
    constructor() {
        nftName = "Synth NFT";
        nftSymbol = "SYN";
        total_user=0;
    }
    
    function mint(address _to,uint256 _tokenId,uint256 _amount, string calldata _uri) external onlyOwner {
        require(total_user<1000,"Users can mint 1000 NFTs");
        require(Total_Wallet[_to]<2,"Each Wallet can mint Max 2 NFTs");
        require(_amount==0.02 ether,"Users can Mint the NFT for 0.02 ETH");
        super._mint(_to,_tokenId);
        Total_Wallet[_to] += 1;
        total_user +=1;
        super._setTokenUri(_tokenId,_uri);
    }
}
