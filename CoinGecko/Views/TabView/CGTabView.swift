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
            
            CategoriyListView()
                .tabItem {
                    Label("Categories", systemImage: "list.bullet.rectangle")
                }
            
            ExchangesListView()
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
    CGTabView()
}
