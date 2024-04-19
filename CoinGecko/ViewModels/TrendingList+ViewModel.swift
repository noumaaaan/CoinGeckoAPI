import Foundation

final class TrendingListViewModel: ObservableObject {
    @Published var trending: CGTrending = .init(coins: [], nfts: [], categories: [])
    @Published var error: Error?
    
    var apiService = APIService()
    
    @MainActor
    func loadData() {
        Task {
            do {
                let trending = try await apiService.fetchTrendingData()
                self.trending = trending
            } catch {
                self.error = error
            }
        }
    }
    
    @MainActor
    func refreshCoinsList() {
        loadData()
    }
}
