import Foundation

final class CoinListViewModel: ObservableObject {
    @Published var coins: [CGCoin] = []
    @Published var error: Error?
    @Published var selectedTimeframe: CGTimeframe = .oneDay
    
    var sorting: CGSort = .marketCapDesc
    var apiService = APIService()
    
    @MainActor
    func loadData() {
        Task {
            do {
                let coins = try await apiService.fetchMarketCoins()
                self.coins.append(contentsOf: coins)
            } catch {
                self.error = error
            }
        }
    }
    
    @MainActor
    func refreshCoinsList() {
        self.coins.removeAll()
        apiService.coinsPage = 0
        loadData()
    }
}
