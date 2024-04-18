import SwiftUI

struct CoinView: View {
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
    let coin: CGCoin
    let timeframe: CGTimeframe
        
    var body: some View {
        GroupBox {
            HStack {
                LogoView(urlString: coin.image, width: Constants.Layout.logo, height: Constants.Layout.logo)
                coinName
                coinPrice
            }
        }
        .cornerRadius(Constants.Layout.cornerRadius)
        .shadow(radius: Constants.Layout.shadowRadius)
        .padding([.horizontal])
    }
}

extension CoinView {
    var coinName: some View {
        VStack(alignment: .leading) {
            Text(coin.name)
                .font(.headline)
                .foregroundStyle(Constants.Colors.foregroundColor)
                .fontWeight(.semibold)
            
            Text(coin.symbol.uppercased())
                .font(.subheadline).bold()
                .foregroundStyle(Constants.Colors.secondaryColor)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var coinPrice: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice?.toCurrency() ?? "")
                .font(.headline)
                .foregroundStyle(Constants.Colors.foregroundColor)
                .fontWeight(.semibold)
            
            Text(percentageChange()?.toPercentString() ?? "")
                .font(.subheadline)
                .foregroundStyle(
                    percentageChange()?.sign == .minus
                    ? Constants.Colors.negative
                    : Constants.Colors.positive
                )
        }
    }
    
    func percentageChange() -> Double? {
        switch timeframe {
        case .oneDay:
            return coin.priceChangePercentage24hInCurrency
        case .oneHour:
            return coin.priceChangePercentage1hInCurrency
        case.oneMonth:
            return coin.priceChangePercentage30dInCurrency
        case .oneWeek:
            return coin.priceChangePercentage7dhInCurrency
        }
    }
}

#Preview {
    CoinView(coin: CGCoinMock().bitcoin, timeframe: .oneDay)
}
