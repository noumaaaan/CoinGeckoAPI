import Foundation

struct CGCoinMock {
    
    // CGCoin
    let bitcoin: CGCoin = .init(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        currentPrice: 63374, 
        marketCap: 1247336329206,
        marketCapRank: 1,
        fullyDilutedValuation: 1330863069961,
        totalVolume: 56300848329, 
        high24H: 67936,
        low24H: 61514, 
        priceChange24H: -3514.1757284080304,
        priceChangePercentage24H: -5.25377,
        marketCapChange24H: -69097889365.45923,
        marketCapChangePercentage24H: -5.24887,
        circulatingSupply: 19682012,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 73738,
        athChangePercentage: -15.16675,
        athDate: "2024-03-14T07:10:36.635Z",
        atl: 67.81,
        atlChangePercentage: 92150.71801,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2024-04-14T03:39:55.043Z",
        priceChangePercentage1hInCurrency: 0.24059681113132322,
        priceChangePercentage24hInCurrency: -4.230150975928614,
        priceChangePercentage30dInCurrency: -7.308455021089008,
        priceChangePercentage7dhInCurrency: -12.42590822411875
    )
    
    // CGCategory
    let layer1: CGCategory = .init(
        id: "layer-1",
        name: "Layer 1 (L1)",
        marketCap: 1894596925167.8267,
        marketCapChange24H: -0.3413211493105112,
        content: "",
        top3_Coins: [
            "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1696501400",
            "https://assets.coingecko.com/coins/images/279/small/ethereum.png?1696501628",
            "https://assets.coingecko.com/coins/images/825/small/bnb-icon2_2x.png?1696501970"
        ],
        volume24H: 66225564581.36339,
        updatedAt: "2024-04-18T20:05:46.971Z"
    )
}
