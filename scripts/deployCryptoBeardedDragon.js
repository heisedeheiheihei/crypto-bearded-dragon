const { ethers } = require("hardhat")

async function main() {
    const CBDFactory = await ethers.getContractFactory("CryptoBeardedDragon");
    
    const CBDDeployment = await CBDFactory.deploy();
    console.log("contract deploying")

    await CBDDeployment.waitForDeployment();
    console.log("contract has been deployed, address: ", CBDDeployment.target)

    // automatically verify deployment result
    await hre.run("verify:verify", {
        address: CBDDeployment.target,
        constructorArguments: [],
    });
}

main().then().catch((error) => {
    console.log(error)
    process.exit(1)
})