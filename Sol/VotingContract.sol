// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VotingContract {
    mapping(address => bool) public hasVoted;

    mapping(address => bytes32) public voteSignatureHash;

    uint public yesVotes;
    uint public noVotes;
    address[] public addresses;


    // Función para votar
    function vote(bool _vote, bytes32 _signatureHash) public {
        require(!hasVoted[msg.sender], "Ya has votado");

        hasVoted[msg.sender] = true;

        addresses.push(msg.sender);

        voteSignatureHash[msg.sender] = _signatureHash;

        if (_vote) {
            yesVotes += 1;
        } else {
            noVotes += 1;
        }
    }

    function getYesVotes() public view returns (uint) {
        return yesVotes;
    }

    function getNoVotes() public view returns (uint) {
        return noVotes;
    }

    function getHasVoted(address _address) public view returns (bool) {
        return hasVoted[_address];
    }

    function getVoteSignatureHash(address _address) public view returns (bytes32) {
        return voteSignatureHash[_address];
    }

    function reset() public {
        yesVotes = 0;
        noVotes = 0;
        
        for (uint i = 0; i < addresses.length; i++) {
            address user = addresses[i];
            voteSignatureHash[user] = bytes32(0);
            hasVoted[user] = false;
        }
    
    }
}
