import SwiftUI

struct CategoriyListView: View {
    private enum Constants {
        enum Layout {
            static let vStackPadding: CGFloat = 5
        }
    }
    @StateObject var viewModel = CategoryListViewModel()
    @State var showAlert = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                content
            }
            .navigationTitle("Categories")
            .toolbarTitleDisplayMode(.inlineLarge)
            .refreshable {
                viewModel.refreshCategoriesList()
            }
            .onReceive(viewModel.$error, perform: { error in
                if error != nil {
                    showAlert.toggle()
                }
            })
            .alert("Error", isPresented: $showAlert) {
                Button("Dismiss", role: .cancel) {}
            } message: {
                Text(viewModel.error?.localizedDescription ?? "")
            }
            .task {
                viewModel.loadData()
            }
        }
    }
}

extension CategoriyListView {
    var content: some View {
        LazyVStack {
            ForEach(viewModel.categories, id: \.self) { category in
                CategoryView(category: category)
                    .onAppear {
                        if viewModel.categories.last == category {
                            viewModel.loadData()
                        }
                    }
            }
        }
        .padding(.top, Constants.Layout.vStackPadding)
    }
}

#Preview {
    CategoriyListView()
}
