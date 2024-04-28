import Foundation

enum Endpoint {
    case fetchTrending
    case fetchCoins(page: Int)
    case fetchCategories
    case fetchExchanges
}

extension Endpoint {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "api.coingecko.com"
    }
    
    var method: String {
        switch self {
        case .fetchTrending, .fetchCoins, .fetchCategories, .fetchExchanges:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .fetchTrending:
            return "/api/v3/search/trending"
        case .fetchCategories:
            return "/api/v3/coins/categories"
        case .fetchCoins:
            return "/api/v3/coins/markets"
        case .fetchExchanges:
            return "/api/v3/exchanges"
        }
    }
        
    var parameters: [URLQueryItem]? {
        var queryItems = [URLQueryItem]()
        
        switch self {
        case .fetchCoins(let page):
            queryItems.append(.init(name: "vs_currency", value: "GBP"))
            queryItems.append(.init(name: "price_change_percentage", value: "1h,24h,7d,30d"))
            queryItems.append(.init(name: "per_page", value: "15"))
            queryItems.append(.init(name: "page", value: String(page)))

        default:
            return nil
        }
        
        queryItems.append(.init(name: "x_cg_demo_api_key", value: Configuration().apiKey))
        return queryItems
    }
}
