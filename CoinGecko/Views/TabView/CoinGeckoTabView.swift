import SwiftUI

struct CoinGeckoTabView: View {
    
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
            
            CategoriyListView()
                .tabItem {
                    Label("Categories", systemImage: "list.bullet.rectangle")
                }
            
            ExchangeListView()
                .tabItem {
                    Label("Exchanges", systemImage: "creditcard")
                }
            
            AboutView()
                .tabItem {
                    Label("About", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    CoinGeckoTabView()
}
