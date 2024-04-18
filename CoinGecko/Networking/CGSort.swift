import Foundation

enum CGSort: String, CaseIterable {
    case marketCapDesc = "market_cap_desc"
    case volumeDesc = "volume_desc"
    
    var label: String {
        switch self {
        case .marketCapDesc:
            return "Market cap"
        case .volumeDesc:
            return "Volume"
        }
    }
    
    mutating func toggle() {
        switch self {
        case .marketCapDesc:
            self = .volumeDesc
        case .volumeDesc:
            self = .marketCapDesc
        }
    }
}
