pragma solidity ^0.4.23;

import "./Owned.sol";
import "";

contract Exchange is Owned {

    struct Token{

    }

    struct Offer {

    }

    struct OrderBook {

    }

    mapping (uint8 => Token ) tokens;
    uint8 SymbolNameIndex;

    mapping (address => mapping(uint => uint)) tokenBalanceForAddress;
    mapping (address => uint) balanceEthforAddress;


    function depositEther () payable {

    }

    function withdrawEther(uint amount inWei){

    }

    function getEthBalanceinWei() constant returns (uint) {

    }

    function depositToken(string symbolName, uint amount) {

    }

    function withdrawToken(string symbolName, uint amount) {

    }

    function getBalance(string symbolName) view returns (uint) {

    }

    function addToken(string symbolName, address erc20TokenAddress) onlyowner{


    }

    function hasToken(string symbolName) constant returns (bool){

    }

    function getSymbolIndex(string symbolName) internal returns (uint8){

    }

    


}