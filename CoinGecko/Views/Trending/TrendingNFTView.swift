import SwiftUI

struct TrendingNFTView: View {
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
    let trendingNFT: TrendingNFT
    
    var body: some View {
        GroupBox {
            nFTNameAndLogo
            informationRow(key: "Currency", value: trendingNFT.nativeCurrencySymbol.uppercased())
            informationRow(key: "Contract UD", value: String(trendingNFT.nftContractID))
            informationRow(key: "Floor price", value: trendingNFT.data.floorPrice)
            informationRow(key: "Average sale", value: trendingNFT.data.h24AverageSalePrice)
            
            Spacer()
        }
        .cornerRadius(Constants.Layout.cornerRadius)
        .shadow(radius: Constants.Layout.shadowRadius)
        .padding(.horizontal, 6)
        .frame(width: 275, height: 200, alignment: .leading)
    }
}

extension TrendingNFTView {
    var nFTNameAndLogo: some View {
        HStack {
            LogoView(urlString: trendingNFT.thumb, width: Constants.Layout.logo, height: Constants.Layout.logo)
                .cornerRadius(10)
                .padding(.bottom)
            VStack(alignment: .leading) {
                Text(trendingNFT.name)
                    .font(.headline)
                    .foregroundStyle(Constants.Colors.foregroundColor)
                    .fontWeight(.semibold)
                
                Text(trendingNFT.symbol.uppercased())
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
    TrendingNFTView(trendingNFT: CGMock().trendingNFT)
}
