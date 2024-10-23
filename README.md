# 鬃狮蜥（bearded dragon）NFT，基于ERC721规范


## 功能
1. 初代创建
2. 父+母繁衍，每一子代数量为0-10之间的随机数
3. 所有权可转让
4. 可使用 remix 单独部署合约到sepolia链上
5. 可使用 hardhat 部署到sepolia链上并验证

## 技术栈
1. solidity
2. hardhat（部署并校验）
3. js/ts
4. chainlink/env-enc（变量加密）

## 部署合约(没有使用ignition)
npx hardhat run scripts/deployCryptoBeardedDragon.js --network sepolia

注意：由于在部署脚本中写了自动验证命令，国内环境下会验证失败，需要配置代理，具体解决方案见 https://github.com/smartcontractkit/full-blockchain-solidity-course-js/discussions/2247#discussioncomment-5496669