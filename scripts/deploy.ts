import { ethers } from "hardhat";
const hre = require("hardhat");

async function main() {
  const SkillBadgeContract = await hre.ethers.getContractFactory("SkillBadgeContract");
  const skillBadgeContract = await SkillBadgeContract.deploy();
  await skillBadgeContract.deployed();
  console.log("SkillBadgeContract deployed to:", skillBadgeContract.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
