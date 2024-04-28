import Foundation

@MainActor
final class TrendingListViewModel: ObservableObject {
    @Published var trending: CGTrending = .init(coins: [], nfts: [], categories: [])
    @Published var error: Error?
    
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
}
