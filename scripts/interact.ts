require('dotenv').config();
const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  const SkillBadgeContract = await hre.ethers.getContractFactory("SkillBadgeContract");
  const skillBadgeContract = await SkillBadgeContract.attach(process.env.CONTRACT_ADDRESS);
  
  // Issue a badge
  const issueTx = await skillBadgeContract.issueBadge("Example Badge", deployer.address);
  await issueTx.wait();
  
  // Check if the badge is claimed
  const isClaimed = await skillBadgeContract.isBadgeClaimed(1); // Replace with actual badge ID
  console.log("Is Badge Claimed:", isClaimed);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
