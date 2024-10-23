require("@nomicfoundation/hardhat-toolbox");
// require("dotenv").config();
require("@chainlink/env-enc").config();

const { ProxyAgent, setGlobalDispatcher } = require("undici");
const proxyAgent = new ProxyAgent("http://127.0.0.1:7890");
setGlobalDispatcher(proxyAgent);

const NETWORK_SEPOLIA_URL = process.env.NETWORK_SEPOLIA_URL
const PRIVATE_KEY = process.env.PRIVATE_KEY
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  mocha: {
    timeout: 60000
  },
  networks: {
    sepolia: {
        url: NETWORK_SEPOLIA_URL,
        accounts: [PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: {
        sepolia: ETHERSCAN_API_KEY
    }
  }
};
