import Foundation

@MainActor
final class CoinListViewModel: ObservableObject {
    @Published var coins: [CGCoin] = []
    @Published var error: Error?
    @Published var selectedTimeframe: CGTimeframe = .oneDay
    
    var page = 1
    
    init() {
        fetchCoins(page: page)
    }
    
    func fetchCoins(page: Int) {
        Task {
            let result = await APIService().fetchCoins(page: page)
            switch result {
            case .success(let success):
                self.coins = success
            case .failure(let failure):
                self.error = failure
            }
        }
    }
    
    func refreshCoinsList() {
        coins.removeAll()
        page = 1
        fetchCoins(page: page)
    }
}
