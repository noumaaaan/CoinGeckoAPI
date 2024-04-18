import SwiftUI

struct CoinListView: View {
    private enum Constants {
        enum Layout {
            static let vStackPadding: CGFloat = 5
        }
    }
    @StateObject var viewModel = CoinListViewModel()
    @State var showAlert = false
    
    var body: some View {
        NavigationStack {
            segmentedPicker
            
            ScrollView {
                content
            }
            .navigationTitle("Coins")
            .toolbarTitleDisplayMode(.inlineLarge)
            .refreshable {
                viewModel.refreshCoinsList()
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
        }
        .task {
            viewModel.loadData()
        }
    }
}

extension CoinListView {
    var segmentedPicker: some View {
        Picker("Timeframe", selection: $viewModel.selectedTimeframe) {
            ForEach(CGTimeframe.allCases, id: \.self) { option in
                Text(option.label)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
    
    var content: some View {
        LazyVStack {
            ForEach(viewModel.coins, id: \.self) { coin in
                
                NavigationLink {
                    CoinDetailView(coin: coin)
                } label: {
                    CoinView(coin: coin, timeframe: viewModel.selectedTimeframe)
                        .onAppear {
                            if viewModel.coins.last == coin {
                                viewModel.loadData()
                            }
                        }
                }
            }
        }
        .padding(.top, Constants.Layout.vStackPadding)
    }
}

#Preview {
    CoinListView()
}
