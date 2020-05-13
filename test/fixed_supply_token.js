var fixedSupplyToken = artifacts.require("./FixedSupplyToken.sol");

contract('MyToken', function(accounts){

    it("first account should own all tokens", function(){
        var _totalSupply;
        var myTokenInstance;
        return fixedSupplyToken.deployed().then(function(instance){
            myTokenInstance = instance;
            return myTokenInstance.totalSupply.call();
        }).then(function(totalSupply){
            _totalSupply = totalSupply;
            return myTokenInstance.balanceOf(accounts[0]);
        }).then(function(balanceAccountOwner){
            assert.equal(balanceAccountOwner.toNumber()._totalSupply.toNumber(), "Total Amount of tokens in owned by owner");

        });
    });

    it("second account should not own any tokens", function(){
        var myTokenInstance;
        return fixedSupplyToken.deployed().then(function(instance){
            myTokenInstance = instance;
            return myTokenInstance.balanceOf(accounts[1]);
        }).then(function(balanceAccountOwner){
            assert.equal(balanceAccountOwner.toNumber(), 0, "Total Amount of tokens is owned by some other account");
        });
    });

    

});