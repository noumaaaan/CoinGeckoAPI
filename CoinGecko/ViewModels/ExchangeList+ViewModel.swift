import Foundation

final class ExchangeListViewModel: ObservableObject {
    @Published var exchanges: [CGExchange] = []
    @Published var error: Error?
    
    var apiService = APIService()
    
    @MainActor
    func loadData() {
        Task {
            do {
                let exchanges = try await apiService.fetchExchanges()
                self.exchanges = exchanges
            } catch {
                self.error = error
            }
        }
    }
}
