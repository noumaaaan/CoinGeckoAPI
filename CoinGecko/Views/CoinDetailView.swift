import SwiftUI

struct CoinDetailView: View {
    let coin: CGCoin
    
    var body: some View {
        
        List {
            Section("Logo") {
                LogoView(urlString: coin.image, width: 100, height: 100)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            Section("Information") {
                listRow(key: "Name", value: coin.name)
                listRow(key: "Symbol", value: coin.symbol)
                listRow(key: "Market rank", value: String(coin.marketCapRank ?? 0))
                listRow(key: "Market cap", value: String(coin.marketCap ?? 0))
                listRow(key: "Total volume", value: String(coin.totalVolume ?? 0))
                listRow(key: "Total supply", value: String(coin.totalSupply ?? 0))
                listRow(key: "Current price", value: coin.currentPrice?.toCurrency() ?? "")
                listRow(key: "High 24h", value: coin.high24H?.toCurrency() ?? "")
                listRow(key: "Low 24h", value: coin.low24H?.toCurrency() ?? "")
                listRow(key: "Price change 24h", value: coin.priceChange24H?.toCurrency() ?? "")
            }
            
            Section("Percentage change") {
                listRow(
                    key: "% change 1h",
                    value: coin.priceChangePercentage1hInCurrency?.toPercentString() ?? ""
                )
                listRow(
                    key: "% change 1 day",
                    value: coin.priceChangePercentage24hInCurrency?.toPercentString() ?? ""
                )
                listRow(
                    key: "% change 7 days",
                    value: coin.priceChangePercentage7dhInCurrency?.toPercentString() ?? ""
                )
                listRow(
                    key: "% change 1 month",
                    value: coin.priceChangePercentage30dInCurrency?.toPercentString() ?? ""
                )
            }
        }
        .navigationTitle(coin.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension CoinDetailView {
    
    func listRow(key: String, value: String) -> some View {
        HStack {
            Text(key)
            Spacer()
            Text(value)
                .foregroundColor(.secondary)
        }
        .lineLimit(1)
        .truncationMode(.tail)
    }
}

#Preview {
    CoinDetailView(coin: CGCoinMock().bitcoin)
}
