pragma solidity ^0.4.23;

contract owned{

    address owner;

    modifier onlyowner(){
        if (msg.sender == owner){
        _;
        }
    }

    function owned(){
        
        owner = msg.sender;

    }
}