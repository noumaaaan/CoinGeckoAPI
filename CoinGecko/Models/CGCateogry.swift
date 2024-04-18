import Foundation

struct CGCategory: Codable, Hashable {
    let id: String
    let name: String
    let marketCap: Double?
    let marketCapChange24H: Double?
    let content: String?
    let top3_Coins: [String]
    let volume24H: Double?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case marketCap = "market_cap"
        case marketCapChange24H = "market_cap_change_24h"
        case content
        case top3_Coins = "top_3_coins"
        case volume24H = "volume_24h"
        case updatedAt = "updated_at"
    }
}
