# Fake tech interview smart contracts coding problem

WARNING: 
https://security.snyk.io/vuln/SNYK-JS-CHAIAWAITUTILS-14152240

Introduced: 30 Nov 2025
Malicious
CVE NOT AVAILABLE
CWE-506
How to fix?
Avoid using all malicious instances of the chai-await-utils package.

Overview
chai-await-utils is a malicious package. This package contains malicious code associated with a social engineering campaign called "Contagious Interview." The attackers target developers through fake job interviews or coding test assignments that require the installation of this package. Once installed, the package acts as a loader for the OtterCookie malware, which connects to a remote server to download and execute a payload granting the attackers full remote access to the victim's system. This malware is designed to steal cryptocurrency wallets, log keystrokes, capture screenshots, and exfiltrate sensitive credentials and files.

References
TheHackerNews Article
https://thehackernews.com/2025/11/north-korean-hackers-deploy-197-npm.html

The malware, once launched, attempts to evade sandboxes and virtual machines, profiles the machine, and then establishes a command-and-control (C2) channel to provide the attackers with a remote shell, along with capabilities to steal clipboard contents, log keystrokes, capture screenshots, and gather browser credentials, documents, cryptocurrency wallet data, and seed phrases.


# Coding task
## Solidity coding problem

This is a Solidity coding problem for tech interviews. It is designed to take **no more than a few hours**.

## Getting setup

Ensure you have installed:

- [Node.js](https://nodejs.org/) **v20+**
- [pnpm](https://pnpm.io/) (install via `npm i -g pnpm`)
- [Hardhat](https://hardhat.org/) (already included as a dev dependency)

## Instructions

### 1. Setup

Clone the repo locally and install the NPM dependencies using pnpm:

### 2. Task

**You only need to write code in the `Token.sol` file. Please ensure all the unit tests pass to successfully complete this part.**

The contracts consist of a mintable ERC-20 `Token` (which is similar to a _Wrapped ETH_ token). Callers mint tokens by depositing ETH. They can then burn their token balance to get the equivalent amount of deposited ETH back.

In addition, token holders can receive dividend payments in ETH in proportion to their token balance relative to the total supply. Dividends are assigned by looping through the list of holders.

Dividend payments are assigned to token holders' addresses. This means that even if a token holder were to send their tokens to somebody else later on or burn their tokens, they would still be entitled to the dividends they accrued whilst they were holding the tokens. 

You will thus need to **efficiently** keep track of individual token holder addresses in order to assign dividend payouts to holders with minimal gas cost.

For a clearer understanding of how the code is supposed to work please refer to the tests in the `test` folder.

Your Solution must pass the test: `pnpm run test` - run the tests (Hardhat)


### 3. Notes:
nvm use 20

After creation set of smart contracts there were failed tests with:

ReferenceError: ethers is not defined

Stack overflow and AI in web browsers suggest fix (but failed and research point on the security issue with chai-await-utils):

npm install --save-dev @nomicfoundation/hardhat-toolbox

npm error code ENOVERSIONS

npm error No versions available for chai-await-utils

