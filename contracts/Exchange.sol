pragma solidity ^0.4.23;

import "./Owned.sol";
import "./FixedsupplyToken.sol";

contract Exchange is owned {

    struct Token{

        string symbolName;
        address tokencontract;

        mapping(uint => OrderBook) buyBook;

        uint curBuyPrice;
        uint lowestBuyPrice;
        uint amountBuyPrices;

        mapping(uint => OrderBook) sellBook;

        uint curSellPrice;
        uint lowestSellPrice;
        uint amountSellPrices;


    }

    struct Offer {

        uint amount;
        address who;

    }

    struct OrderBook {
        uint higherPrice;
        uint lowerPrice;

        mapping(uint => offer) offers;

        uint offers_key;
        uint offers_length;


    }

    mapping (uint8 => Token ) tokens;
    uint8 SymbolNameIndex;

    mapping (address => mapping(uint => uint)) tokenBalanceForAddress;
    mapping (address => uint) balanceEthforAddress;


    function depositEther () payable {
        require(balanceEthforAddress[msg.sender] - amountinWei <= balanceEthforAddress[msg.sender]);
        balanceEthforAddress[msg.sender] += msg.value;


    }

    function withdrawEther(uint amountinWei){
                require(balanceEthforAddress[msg.sender] + msg.value >= balanceEthforAddress[msg.sender]);
        balanceEthforAddress[msg.sender] -= amountinWei;
        msg.sender.transfer(amountinWei);

    }

    function getEthBalanceinWei() constant returns (uint) {
        return balanceEthforAddress[msg.sender];
    }

    function depositToken(string symbolName, uint amount) {
        uint symbolNameIndex = getSymbolIndexorthrow(symbolName);
         require(tokenBalanceForAddress[msg.sender] + amount >= tokenBalanceForAddress[msg.sender]);

        ERC20Interface token = ERC20Interface(tokens[SymbolNameIndex].tokencontract);

        tokenBalanceForAddress[msg.sender][symbolNameIndex] += amount;

    }

    function withdrawToken(string symbolName, uint amount) {
        uint symbolNameIndex = getSymbolIndexorthrow(symbolName);
        require(tokenBalanceForAddress[msg.sender] - amount <= tokenBalanceForAddress[msg.sender]);

        ERC20Interface token = ERC20Interface(tokens[SymbolNameIndex].tokencontract);

        tokenBalanceForAddress[msg.sender][symbolNameIndex] -= amount;

    }

    function getBalance(string symbolName) view returns (uint) {
        uint symbolNameIndex = getSymbolIndexorthrow(symbolName);
        return tokenBalanceForAddress[msg.sender][symbolNameIndex];

    }

    function addToken(string symbolName, address erc20TokenAddress) onlyowner{

        require(!hasToken(symbolName));
        SymbolNameIndex++;
        tokens[SymbolNameIndex].symbolName = symbolName;
        tokens[SymbolNameIndex].tokencontract = erc20TokenAddress;


    }

    function hasToken(string symbolName) constant returns (bool){
        uint index = getSymbolIndex(symbolName);
        if(index==0)
        {
            return false;
        }
        return true;

    }

    function getSymbolIndex(string symbolName) internal returns (uint8){

        for(uint8 =1; i<=SymbolIndexName; i++){
            if(stringsEqual(tokens[i].symbolName, symbolName))
                return i;

        }
        return 0;

    }

    function getSymbolIndexorthrow(string symbolName) returns (uint8){
        uint index = getSymbolIndex(symbolName);
        return index;
    }

    function stringsEqual(string storage _a, string memory _b) internal returns(bool)
        bytes storage a= bytes(_a);
        bytes memory b = bytes(_b);

        if(a.length != b.length)
        return false;

        for (uint i=0; i<a.length; i++)
            if (a[i]) != b[i]
            return false;

            return true;

    function getBuyOrderBook (string symbolName) constant returns(uint[], uint[]) {

    } 

    
    function getSellOrderBook (string symbolName) constant returns(uint[], uint[]) {

    } 

    function buyToken(string symbolName, uint priceinWei, uint amount) {
        uint symbolNameIndex = getSymbolIndexorthrow(symbolName);
        uint total_amount_ether_necessary = 0;
        uint total_amount_ether_available = 0;

        total_amount_ether_necessary = amount*priceinWei;

        balanceEthforAddress[msg.sender] -= total_amount_ether_necessary;

        if(tokens[tokenNameIndex].amountSellPrices == 0 || tokens[tokenNameIndex].curSellPrice > priceinWei)
            {addBuyOffer(tokenNameIndex, priceinWei, amount, msg.sender);


            LimitBuyOrderCreated(tokenNameIndex, msg.sender, amount, priceinWei, tokens[tokenNameIndex].buyBook[priceinWei].offers_length);
            
            }else
            revert();

    }

    function sellToken(string symbolName, uint priceinWei, uint amount){

    }


    function cancelOrder(string symbolName, bool isSellOrder, uint priceinWei, uint offerKey) {
        
    }




}