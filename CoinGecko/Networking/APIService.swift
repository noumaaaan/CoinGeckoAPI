import Foundation

final class APIService {
    
    func fetchCoins(page: Int, id: String? = nil) async -> Result<[CGCoin], CGErorr> {
        return await request(endpoint: .fetchCoins(page: page, id: id), responseModel: [CGCoin].self)
    }
    
    func fetchCategories() async -> Result<[CGCategory], CGErorr> {
        return await request(endpoint: .fetchCategories, responseModel: [CGCategory].self)
    }
    
    func fetchTrending() async -> Result<CGTrending, CGErorr> {
        return await request(endpoint: .fetchTrending, responseModel: CGTrending.self)
    }
    
    func fetchExchanges() async -> Result<[CGExchange], CGErorr> {
        return await request(endpoint: .fetchExchanges, responseModel: [CGExchange].self)
    }
    
    func request<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, CGErorr> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.parameters
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.apiError)
                }
                return .success(decodedResponse)
            default:
                return .failure(.invalidResponse)
            }
        } catch {
            return .failure(.unknown(error))
        }
    }
}
