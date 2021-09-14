const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("DAO", function () {
  it("Should create and vote on a proposal.", async function () {
    const members = ["0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266", "0x70997970c51812dc3a010c7d01b50e0d17dc79c8", "0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc", "0x90f79bf6eb2c4f870365e785982e1f101e93b906"]
    const DAO = await ethers.getContractFactory("PowDAO");
    const dao = await DAO.deploy(members);
    await dao.deployed();

    const submitAProposal = await dao.submitProposal("0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266",250,"0x6b175474e89094c44da98b954eedeac495271d0f","https://ipfs.io/ipfs/QmbFMke1KXqnYyBBWxB74N4c5SBnJMVAiMNRcGu6x1AwQH");
    await submitAProposal.wait();
    console.log(submitAProposal)

    const voteOnProp = await dao.submitVote(0,1);
    await voteOnProp.wait();
    
    const proposals = await dao.proposalCount();
    console.log("-----------------------------")
    console.log(parseInt(proposals))

    expect(await dao.proposalCount()).to.equal(1);
    
  });
});
