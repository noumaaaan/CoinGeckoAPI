//
//  CategoryView.swift
//  CoinGecko
//
//  Created by Noumaan Mehmood on 18/04/2024.
//

import SwiftUI

struct CategoryView: View {
    private enum Constants {
        enum Colors {
            static let foregroundColor: Color = .black
            static let secondaryColor: Color = .gray
            static let positive: Color = .green
            static let negative: Color = .red
        }
        enum Layout {
            static let logo: CGFloat = 45
            static let cornerRadius: CGFloat = 10
            static let shadowRadius: CGFloat = 3
            static let idBottomSpacing: CGFloat = 20
        }
    }
    let category: CGCategory
    var body: some View {
        GroupBox {
            categoryInformation
            topCoins
        }
        .cornerRadius(Constants.Layout.cornerRadius)
        .shadow(radius: Constants.Layout.shadowRadius)
        .padding([.horizontal])
    }
}

extension CategoryView {
    var categoryInformation: some View {
        VStack(alignment: .leading) {
            Text(category.name)
                .font(.headline)
                .foregroundStyle(Constants.Colors.foregroundColor)
                .fontWeight(.semibold)
            
            Text(category.id)
                .font(.caption)
                .foregroundStyle(Constants.Colors.secondaryColor)
                .padding([.bottom])
            
            categoryItemView(key: "24h Volume:", value: category.volume24H?.toCurrency() ?? "")
            categoryItemView(key: "Market cap:", value: category.marketCap?.toCurrency() ?? "")
            categoryItemView(key: "Market cap change:", value: category.marketCapChange24H?.toPercentString() ?? "", representSignum: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var topCoins: some View {
        HStack(spacing: Constants.Layout.idBottomSpacing) {
            ForEach(category.top3_Coins, id: \.self) { cat in
                LogoView(urlString: cat, width: Constants.Layout.logo, height: Constants.Layout.logo)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private func categoryItemView(key: String, value: String, representSignum: Bool = false) -> some View {
        HStack {
            Text(key)
            Spacer()
            Text(value)
                .foregroundStyle(
                    representSignum 
                    ? value.contains("-") 
                    ? Constants.Colors.negative
                    : Constants.Colors.positive
                    : Constants.Colors.foregroundColor
                )
        }
        .font(.subheadline)
        .foregroundStyle(Constants.Colors.foregroundColor)
    }
}


#Preview {
    CategoryView(category: CGCoinMock().layer1)
}
