import Foundation

@MainActor
final class CategoryListViewModel: ObservableObject {
    @Published var categories: [CGCategory] = []
    @Published var error: Error?
    
    init() {
        fetchCategories()
    }
    
    func fetchCategories() {
        Task {
            let result = await APIService().fetchCategories()
            switch result {
            case .success(let success):
                self.categories = success
            case .failure(let failure):
                self.error = failure
            }
        }
    }
}
