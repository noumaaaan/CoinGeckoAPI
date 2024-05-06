import Foundation

@MainActor
final class TrendingListViewModel: ObservableObject {
    @Published var trending: CGTrending = .init(coins: [], nfts: [], categories: [])
    @Published var error: Error?
    
    var selectedCoin: CGCoin?
    
    init() {
        fetchTrending()
    }
    
    func fetchTrending() {
        Task {
            let result = await APIService().fetchTrending()
            switch result {
            case .success(let success):
                self.trending = success
            case .failure(let failure):
                self.error = failure
            }
        }
    }
    
    func fetchCoin(id: String) {
        Task {
            let result = await APIService().fetchCoins(page: 1, id: id)
            switch result {
            case .success(let success):
                self.selectedCoin = success.first
            case .failure(let failure):
                self.error = failure
            }
        }
    }
    
    func refreshTrendingData() {
        fetchTrending()
    }
}
