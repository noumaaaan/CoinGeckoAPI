import SwiftUI

struct CGTabView: View {
    
    var body: some View {
        TabView {
            TrendingListView()
                .tabItem {
                    Label("Trending", systemImage: "chart.xyaxis.line")
                }
            
            CoinListView()
                .tabItem {
                    Label("Coins", systemImage: "sterlingsign.arrow.circlepath")
                }
            
            CategoriesListView()
                .tabItem {
                    Label("Categories", systemImage: "list.bullet.rectangle")
                }
            
            ExchangesListView()
                .tabItem {
                    Label("Exchanges", systemImage: "creditcard")
                }
        }
    }
}

#Preview {
    CGTabView()
}
