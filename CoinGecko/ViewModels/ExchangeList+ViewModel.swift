import Foundation

@MainActor
final class ExchangeListViewModel: ObservableObject {
    @Published var exchanges: [CGExchange] = []
    @Published var error: Error?
    
    init() {
        fetchExchanges()
    }
    
    func fetchExchanges() {
        Task {
            let result = await APIService().fetchExchanges()
            switch result {
            case .success(let success):
                self.exchanges = success
            case .failure(let failure):
                self.error = failure
            }
        }
    }
}
