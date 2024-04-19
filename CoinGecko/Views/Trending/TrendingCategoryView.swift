import SwiftUI

struct TrendingCategoryView: View {
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
    let trendingCategory: TrendingCategory
    
    var body: some View {
        GroupBox {
            categoryName
            informationRow(key: "Coins", value: String(trendingCategory.coinsCount))
            informationRow(key: "Market", value: String(trendingCategory.data.marketCap))
            informationRow(key: "Volume", value: String(trendingCategory.data.totalVolume))
            
            Spacer()
        }
        .cornerRadius(Constants.Layout.cornerRadius)
        .shadow(radius: Constants.Layout.shadowRadius)
        .padding(.horizontal, 6)
        .frame(width: 310, height: 175, alignment: .leading)
    }
}

extension TrendingCategoryView {
    var categoryName: some View {
        VStack(alignment: .leading) {
            Text(trendingCategory.name)
                .font(.headline)
                .foregroundStyle(Constants.Colors.foregroundColor)
                .fontWeight(.semibold)
            
            Text(String(trendingCategory.id))
                .font(.subheadline).bold()
                .foregroundStyle(Constants.Colors.secondaryColor)
        }
        .lineLimit(2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom)
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
    TrendingCategoryView(trendingCategory: CGMock().trendingCategory)
}
