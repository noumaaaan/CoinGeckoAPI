import Foundation

class CoinListViewModel: ObservableObject {
    @Published var coins: [CGCoin] = []
    @Published var error: Error?
    @Published var selectedTimeframe: TimeframeChange = .oneDay
    
    var sorting: CGSort = .marketCapDesc
    var apiService = APIService()
    
    @MainActor
    func loadData() {
        Task {
            do {
                let coins = try await apiService.fetchMarketCoins(sorting: sorting)
                self.coins.append(contentsOf: coins)
            } catch {
                self.error = error
            }
        }
    }
    
    @MainActor
    func refreshCoinsList() {
        self.coins.removeAll()
        apiService.page = 0
        loadData()
    }
    
    @MainActor
    func toggleSorting() {
        sorting.toggle()
        refreshCoinsList()
    }
}
