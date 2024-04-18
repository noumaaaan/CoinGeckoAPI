import Foundation

class APIService {
    
    private let baseURL = "https://api.coingecko.com/api/v3/"
    private let itemsPerPage = 10
    var page = 0
    
    func fetchMarketCoins(sorting: CGSort = .marketCapDesc) async throws -> [CGCoin] {
        page += 1
        
        let urlString = "\(baseURL)coinsds/markets?vs_curresdncy=GBP&price_change_percentage=1h%2C24h%2C7d%2C30d&per_page=\(itemsPerPage)&page=\(page)?x_cg_demo_api_key=\(Configuration().apiKey)"
        print(urlString)
        print(page)
        
        guard let url = URL(string: urlString) else { throw CGErorr.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw CGErorr.invalidResponse
        }
         
        do {
            let coins = try JSONDecoder().decode([CGCoin].self, from: data)
            return coins
        } catch let error {
            print(error)
            throw CGErorr.apiError
        }
        
    }
}
