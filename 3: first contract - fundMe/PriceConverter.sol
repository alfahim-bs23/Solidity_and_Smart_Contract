// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter{

    // get the usd price for 1 eth(in terms of wei).
    function getPrice() internal view returns(uint256){
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer,,,)=priceFeed.latestRoundData();
        
        // return priceFeed.decimals();
        // answer will be something like will 8 decimals: 1575,62090000
        // but transaction will be in terms of wei with 18
        return uint256(answer*1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){

        uint256 usdPrice=getPrice();
        uint256 ethAmountInUSD=(usdPrice*ethAmount)/1e18;
        return ethAmountInUSD;
    }
}