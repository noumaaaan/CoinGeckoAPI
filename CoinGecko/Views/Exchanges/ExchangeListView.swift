import SwiftUI

struct ExchangeListView: View {
    private enum Constants {
        enum Layout {
            static let vStackPadding: CGFloat = 5
        }
    }
    @StateObject var viewModel = ExchangeListViewModel()
    @State var showAlert = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                content
            }
            .navigationTitle("Exchanges")
            .toolbarTitleDisplayMode(.inlineLarge)
//            .refreshable {
//                viewModel.refreshCoinsList()
//            }
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
        }
        .task {
            viewModel.loadData()
        }
    }
}

extension ExchangeListView {
    var content: some View {
        LazyVStack {
            ForEach(viewModel.exchanges, id: \.self) { exchange in
                
                NavigationLink {
                    // CoinDetailView(coin: coin)
                } label: {
                    ExchangeView(exchange: exchange)
//                        .onAppear {
//                            if viewModel.coins.last == coin {
//                                viewModel.loadData()
//                            }
//                        }
                }
            }
        }
        .padding(.top, Constants.Layout.vStackPadding)
    }
}

#Preview {
    ExchangeListView()
}
