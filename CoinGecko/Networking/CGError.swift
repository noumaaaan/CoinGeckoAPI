import Foundation

enum CGErorr: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case apiError
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .apiError:
            return "Something went wrong"
        case .invalidURL:
            return "The URL received was invalid"
        case .invalidResponse:
            return "The response from the server was invalid"
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
