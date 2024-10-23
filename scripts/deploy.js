const hre = require("hardhat");

async function main() {
  const Tournament = await hre.ethers.getContractFactory("Tournament");
  const tournament = await Tournament.deploy();

  await tournament.deployed();

  console.log("Tournament deployed to:", tournament.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
