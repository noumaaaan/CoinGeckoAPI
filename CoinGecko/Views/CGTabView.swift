import SwiftUI

struct CGTabView: View {
    
    var body: some View {
        TabView {
            CoinListView()
                .tabItem {
                    Label("Coins", systemImage: "sterlingsign.arrow.circlepath")
                }
            
            AboutView()
                .tabItem {
                    Label("Coins", systemImage: "gear")
                }
        }
    }
}

#Preview {
    CGTabView()
}
