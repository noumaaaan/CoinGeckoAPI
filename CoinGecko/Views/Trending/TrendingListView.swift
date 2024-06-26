import SwiftUI

struct TrendingListView: View {
    private enum Constants {
        enum Layout {
            static let vStackPadding: CGFloat = 5
        }
    }
    @StateObject var viewModel = TrendingListViewModel()
    @State var showAlert = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Coins
                    headerString(title: "Coins")
                    coinsContent
                    
                    // NFTs
                    headerString(title: "NFTs")
                    nftContent
                    
                    // Categories
                    headerString(title: "Categories")
                    categoryContent
                    
                    Spacer()
                }
            }
            .navigationTitle("Trending")
            .toolbarTitleDisplayMode(.inlineLarge)
            .refreshable {
                viewModel.refreshTrendingData()
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
    }
}

extension TrendingListView {
    func headerString(title: String) -> some View {
        Text(title)
            .font(.title2.bold())
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading])
    }
    
    var coinsContent: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: .zero) {
                ForEach(viewModel.trending.coins, id: \.self) { coin in
                    
                    NavigationLink {
//                        CoinDetailView(coin: coin)
//                        CoinDetailView(coin: coin)
                        Color.red
                    } label: {
                        TrendingCoinView(trendingCoin: coin)
                    }
                }
            }
            .padding(.vertical, Constants.Layout.vStackPadding)
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .fixedSize(horizontal: false, vertical: true)
        .scrollTargetBehavior(.viewAligned)
    }
    
    var nftContent: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: .zero) {
                ForEach(viewModel.trending.nfts, id: \.self) { nft in
                    TrendingNFTView(trendingNFT: nft)
                }
            }
            .padding(.vertical, Constants.Layout.vStackPadding)
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .fixedSize(horizontal: false, vertical: true)
        .scrollTargetBehavior(.viewAligned)
    }
    
    var categoryContent: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: .zero) {
                ForEach(viewModel.trending.categories, id: \.self) { category in
                    TrendingCategoryView(trendingCategory: category)
                }
            }
            .padding(.vertical, Constants.Layout.vStackPadding)
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .fixedSize(horizontal: false, vertical: true)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    TrendingListView()
}
