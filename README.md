# 🏛️ Simple DAO with Re-Entrancy Example

> Quickly spin up a DAO smart contract where you choose the initial group of members.

## 📘 DAO Specifics

Quickly initiate a DAO by sending an array of address in the constructor of this contract on deploy. DAO proposals can be created by anyone, but only voted on by members. Members can create proposals to add or kick members. Members cannot withdraw their deposited funds once they are deposited. All deposited funds will be used for the good of the DAO.

Public Goods...
This type of DAO can be used by sports teams to pay for field time, equipment, travel, etc. Another use case is for public contruction or maintenance projects. 
A neighborhood/ town/ governoment can deposit a bunch of funds which can be democratically voted on and invoices can be submitted by the contractors.  

## ⭐ Bonus

A re-entrancy proxy contract has been created to verify the security of the PowDAO contract withdraw function. This contract can be found in the contracts folder. To create a re-entrancy attack when you are withdrawing your funds, use the 'getPayoutUnsafe' function versus 'getPayout' which does not have the re-entrancy vulnerability. 

Re-entrancy is caused by repeatedly calling the a fallback function in the proxy contracts receive function. This will create a loop which will be executed until it runs out of gas making repeated function calls. Try for yourself!

[Info on Re-Entrancy Attack](https://quantstamp.com/blog/what-is-a-re-entrancy-attack)

Scaffold-Eth implementation: https://github.com/PowVT/scaffold-eth/tree/simple-DAO-proposals

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/deploy.js
npx hardhat help
```
