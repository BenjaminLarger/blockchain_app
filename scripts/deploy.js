const hre = require("hardhat");

async function main() {
  const Contract = await hre.ethers.deployContract("TournamentManager", []);

  await Contract.waitForDeployment();

  console.log(`Contract deployed to ${await Contract.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});