import Foundation

struct CGExchange: Codable, Hashable {
    let id: String
    let name: String
    let yearEstablished: Int?
    let country: String?
    let description: String?
    let url: String
    let image: String
    let hasTradingIncentive: Bool?
    let trustScore: Int
    let trustScoreRank: Int
    let tradeVolume24HBtc: Double
    let tradeVolume24HBtcNormalized: Double

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case yearEstablished = "year_established"
        case country
        case description
        case url
        case image
        case hasTradingIncentive = "has_trading_incentive"
        case trustScore = "trust_score"
        case trustScoreRank = "trust_score_rank"
        case tradeVolume24HBtc = "trade_volume_24h_btc"
        case tradeVolume24HBtcNormalized = "trade_volume_24h_btc_normalized"
    }
}
