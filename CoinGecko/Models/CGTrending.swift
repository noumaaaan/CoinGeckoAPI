import Foundation

struct CGTrending: Codable, Hashable {
    let coins: [TrendingCoin]
    let nfts: [TrendingNFT]
    let categories: [TrendingCategory]
}

// MARK: - TrendingCoin
struct TrendingCoin: Codable, Hashable {
    let item: CoinItem
}

struct CoinItem: Codable, Hashable {
    let id: String
    let coinID: Int
    let name: String
    let symbol: String
    let marketCapRank: Int
    let thumb: String
    let slug: String
    let score: Int
    let data: CoinItemData

    enum CodingKeys: String, CodingKey {
        case id
        case coinID = "coin_id"
        case name
        case symbol
        case marketCapRank = "market_cap_rank"
        case thumb
        case slug
        case score
        case data
    }
}

struct CoinItemData: Codable, Hashable {
    let price: Double
    let marketCap: String
    let totalVolume: String
    let sparkline: String
    let content: CoinItemDataContent?

    enum CodingKeys: String, CodingKey {
        case price
        case marketCap = "market_cap"
        case totalVolume = "total_volume"
        case sparkline
        case content
    }
}

struct CoinItemDataContent: Codable, Hashable {
    let title: String
    let description: String
}

// MARK: - TrendingNFT
struct TrendingNFT: Codable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
    let nftContractID: Int
    let nativeCurrencySymbol: String
    let data: NftData

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case thumb
        case nftContractID = "nft_contract_id"
        case nativeCurrencySymbol = "native_currency_symbol"
        case data
    }
}

struct NftData: Codable, Hashable {
    let floorPrice: String
    let floorPriceInUsd24HPercentageChange: String
    let h24Volume: String
    let h24AverageSalePrice: String
    let sparkline: String

    enum CodingKeys: String, CodingKey {
        case floorPrice = "floor_price"
        case floorPriceInUsd24HPercentageChange = "floor_price_in_usd_24h_percentage_change"
        case h24Volume = "h24_volume"
        case h24AverageSalePrice = "h24_average_sale_price"
        case sparkline
    }
}

// MARK: - TrendingCategory
struct TrendingCategory: Codable, Hashable {
    let id: Int
    let name: String
    let marketCap1HChange: Double
    let slug: String
    let coinsCount: Int
    let data: CategoryData

    enum CodingKeys: String, CodingKey {
        case id, name
        case marketCap1HChange = "market_cap_1h_change"
        case slug
        case coinsCount = "coins_count"
        case data
    }
}

struct CategoryData: Codable, Hashable {
    let marketCap: Double
    let totalVolume: Double
    let sparkline: String

    enum CodingKeys: String, CodingKey {
        case marketCap = "market_cap"
        case totalVolume = "total_volume"
        case sparkline
    }
}
