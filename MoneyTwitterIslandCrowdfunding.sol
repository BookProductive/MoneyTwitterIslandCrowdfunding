// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title MoneyTwitterIslandCrowdfunding
 * @dev Crowdfunding campaign so twitter homies can buy an island and scape the soy
 */
contract MoneyTwitterIslandCrowdfunding {
    uint public maximum;
    address payable public creator;
    bool public done = false;
    
    mapping(address => uint) public donations;
    
    constructor(uint max, address contractCreator) {
        maximum = max;
        creator = payable(contractCreator);
    }
    
    function donate() public payable {
        require(!done);
        require(msg.value > 0);
        donations[msg.sender] = donations[msg.sender] + msg.value;
        if (address(this).balance > maximum) {
            creator.transfer(address(this).balance);
            done = true;
        }
    }
}
