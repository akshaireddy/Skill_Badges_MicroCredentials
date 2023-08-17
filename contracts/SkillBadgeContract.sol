// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Define the skill badge structure
struct SkillBadge {
    uint256 id;
    string name;
    address recipient;
    bool claimed;
}

// Main contract
contract SkillBadgeContract {
    address public owner;
    uint256 public badgeCount;
    mapping(uint256 => SkillBadge) public badges;

    // Event emitted when a new badge is issued
    event BadgeIssued(uint256 id, string name, address recipient);

    constructor() {
        owner = msg.sender;
        badgeCount = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Function to issue a new badge
    function issueBadge(string memory _name, address _recipient) public onlyOwner {
        badgeCount++;
        badges[badgeCount] = SkillBadge(badgeCount, _name, _recipient, false);
        emit BadgeIssued(badgeCount, _name, _recipient);
    }

    // Function to claim a badge
    function claimBadge(uint256 _badgeId) public {
        require(badges[_badgeId].recipient == msg.sender, "You are not the recipient of this badge");
        require(!badges[_badgeId].claimed, "Badge has already been claimed");
        badges[_badgeId].claimed = true;
    }

    // Function to verify if a badge is claimed
    function isBadgeClaimed(uint256 _badgeId) public view returns (bool) {
        return badges[_badgeId].claimed;
    }
}
