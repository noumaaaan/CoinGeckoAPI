import SwiftUI

struct TrendingCoinView: View {
    private enum Constants {
        enum Colors {
            static let foregroundColor: Color = .black
            static let secondaryColor: Color = .gray
            static let positive: Color = .green
            static let negative: Color = .red
        }
        enum Layout {
            static let logo: CGFloat = 60
            static let cornerRadius: CGFloat = 10
            static let shadowRadius: CGFloat = 3
        }
    }
    let trendingCoin: TrendingCoin
    
    var body: some View {
        GroupBox {
            coinNameAndLogo
            informationRow(key: "Rank", value: String(trendingCoin.item.marketCapRank))
            informationRow(key: "Price", value: trendingCoin.item.data.price.asDecimalString())
            informationRow(key: "Market", value: trendingCoin.item.data.marketCap)
            informationRow(key: "Volume", value: trendingCoin.item.data.totalVolume)
            
            Spacer()
        }
        .cornerRadius(Constants.Layout.cornerRadius)
        .shadow(radius: Constants.Layout.shadowRadius)
        .padding(.horizontal, 6)
        .frame(width: 295, height: 200, alignment: .leading)
    }
}

extension TrendingCoinView {
    var coinNameAndLogo: some View {
        HStack {
            LogoView(urlString: trendingCoin.item.thumb, width: Constants.Layout.logo, height: Constants.Layout.logo)
                .cornerRadius(10)
                .padding(.bottom)
            VStack(alignment: .leading) {
                Text(trendingCoin.item.name)
                    .font(.headline)
                    .foregroundStyle(Constants.Colors.foregroundColor)
                    .fontWeight(.semibold)
                
                Text(trendingCoin.item.symbol.uppercased())
                    .font(.subheadline).bold()
                    .foregroundStyle(Constants.Colors.secondaryColor)
            }
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom)
        }
    }
    
    private func informationRow(key: String, value: String) -> some View {
        HStack {
            Text(key)
                .foregroundStyle(Constants.Colors.secondaryColor)
            Spacer()
            Text(value)
                .foregroundStyle(Constants.Colors.foregroundColor)
        }
        .font(.subheadline)
    }
}

#Preview {
    TrendingCoinView(trendingCoin: CGMock().trendingCoin)
}
