# 鬃狮蜥（bearded dragon）NFT，基于ERC721规范


## 功能
1. 初代创建
2. 父+母繁衍，每一子代数量为0-10之间的随机数
3. 所有权可转让
4. remix部署sepolia线上合约地址 https://sepolia.etherscan.io/address/0x52C5446887C4B1fA03D522D8fAce5DCCa5b68DDa
5. hardhat部署sepolia线上合约地址 https://sepolia.etherscan.io/address/0xbC41000C43D346d6000284f9F42b0A7Ed7B48fb3

## 技术栈
1. solidity
2. hardhat（部署并校验）
3. chainlink/env-enc（变量加密）

## 部署合约(没有使用ignition)
npx hardhat run scripts/deployCryptoBeardedDragon.js --network sepolia

注意：由于在部署脚本中写了自动验证命令，国内环境下会验证失败，需要配置代理，具体解决方案见 https://github.com/smartcontractkit/full-blockchain-solidity-course-js/discussions/2247#discussioncomment-5496669