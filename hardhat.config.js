require("@nomicfoundation/hardhat-toolbox");
require("hardhat-contract-sizer");
require("solidity-docgen");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.24",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  contractSizer: {
    alphaSort: true,
    runOnCompile: true,
    disambiguatePaths: false,
    strict: true,
  },
  docgen: {
    sourcesDir: "contracts",
    outputDir: "documentation",
    templates: "templates",
    pages: "files",
    clear: true,
    runOnCompile: true,
  },
};
