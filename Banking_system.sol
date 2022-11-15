// SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 < 0.9.0;

contract DemoBank{

    address public owner;

    // below is the list of user_adresses with the balace associated with them in the bank
    mapping(address => uint256) private userBalance; 

    // below constructor initialises the owner as the msg sender or one who has deployed the contract
    constructor() public {
        owner = msg.sender;
    }

    // below modifier insures that only the owner has the permission to use the function associated with modifier
    modifier onlyOwner(){
        require(msg.sender == owner , 'You are not the owner');
        _;
    }
    
    // below function is used to deposite fundes in the user's account
    function deposite() public payable returns(bool){
        require(msg.value > 10 wei , 'Please send atleast 10 wei');
        userBalance[msg.sender] += msg.value;
        return true;
    }

    // below function is used to withdraw fundes from the user's account
    function withdraw(uint256 _amount) public payable returns(bool){
        require(_amount <= userBalance[msg.sender] , 'Unsufficient balance'); 
        userBalance[msg.sender] -= msg.value;
        payable(msg.sender).transfer(_amount);
        return true;
    }
    
    //below is the function to get balance of any user
    function getBalance() public view returns(uint256){
        return userBalance[msg.sender];
    } 

    //below function can only be executed by the owner of the contract or bank to get the balance of whole bank
    function getContractBalance() public view onlyOwner returns (uint256){
        return address(this).balance;
    }

    //below function can only be executed by the owner of the contract or bank to withdraw amount from the bank
    function withdrawBankFunds(uint256 _amount) public payable onlyOwner returns (bool){
        payable(owner).transfer(_amount);
        return true;
    }
    
}
