const hre = require("hardhat");
async function main() {
  const SimpleVault = await hre.ethers.getContractFactory("SimpleVault");
  console.log("Deploying your contract, please Wait.....");
  const simplevault = await SimpleVault.deploy();
  await simplevault.deployed();
  console.log("Vault Contract deployed to:", simplevault.address);
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });