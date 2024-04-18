import Foundation

class APIService {
    
    private let baseURL = "https://api.coingecko.com/api/v3/"
    private let apiKeyURL = "?x_cg_demo_api_key=\(Configuration().apiKey)"
    private let itemsPerPage = 10
    var coinsPage = 0
    
    func fetchMarketCoins() async throws -> [CGCoin] {
        coinsPage += 1
        
        let urlString = "\(baseURL)coins/markets?vs_currency=GBP&price_change_percentage=1h%2C24h%2C7d%2C30d&per_page=\(itemsPerPage)&page=\(coinsPage)\(apiKeyURL)"
        guard let url = URL(string: urlString) else { throw CGErorr.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw CGErorr.invalidResponse }
         
        do {
            let coins = try JSONDecoder().decode([CGCoin].self, from: data)
            return coins
        } catch {
            throw CGErorr.apiError
        }
    }
    
    func fetchMarketCategories() async throws -> [CGCategory] {
        let urlString = "\(baseURL)coins/categories\(apiKeyURL)"
        guard let url = URL(string: urlString) else { throw CGErorr.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw CGErorr.invalidResponse }
         
        do {
            let categories = try JSONDecoder().decode([CGCategory].self, from: data)
            return categories
        } catch {
            throw CGErorr.apiError
        }
    }
    
}
