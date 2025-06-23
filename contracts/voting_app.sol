// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract Voting {
  struct Proposal {
        string description;
        uint voteCount;
    }

    Proposal[] public proposals;
    mapping(address => bool) public hasVoted;

    function createProposal(string memory _desc) public {
        proposals.push(Proposal(_desc, 0));
    }

    function vote(uint _proposalId) public {
        require(!hasVoted[msg.sender], "Already voted");
        require(_proposalId < proposals.length, "Invalid proposal");

        proposals[_proposalId].voteCount += 1;
        hasVoted[msg.sender] = true;
    }

    function getResults(uint _proposalId) public view returns (uint) {
        require(_proposalId < proposals.length, "Invalid proposal");
        return proposals[_proposalId].voteCount;
    }
}
