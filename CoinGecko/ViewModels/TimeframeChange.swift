import Foundation

enum TimeframeChange: CaseIterable {
    case oneHour
    case oneDay
    case oneWeek
    case oneMonth
    
    var label: String {
        switch self {
        case .oneHour:
            return "1 hour"
        case .oneDay:
            return "24 hours"
        case .oneWeek:
            return "7 days"
        case .oneMonth:
            return "30 days"
        }
    }
}
