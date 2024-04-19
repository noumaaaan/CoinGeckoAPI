import Foundation

final class CategoryListViewModel: ObservableObject {
    @Published var categories: [CGCategory] = []
    @Published var error: Error?
    
    var apiService = APIService()
    
    @MainActor
    func loadData() {
        Task {
            do {
                let categories = try await apiService.fetchMarketCategories()
                self.categories.append(contentsOf: categories)
            } catch {
                self.error = error
            }
        }
    }
}
