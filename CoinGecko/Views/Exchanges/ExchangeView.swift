import SwiftUI

struct ExchangeView: View {
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
    let exchange: CGExchange
        
    var body: some View {
        GroupBox {
            HStack {
                LogoView(urlString: exchange.image, width: Constants.Layout.logo, height: Constants.Layout.logo)
                exchangeName
                trustScore
            }
        }
        .cornerRadius(Constants.Layout.cornerRadius)
        .shadow(radius: Constants.Layout.shadowRadius)
        .padding([.horizontal])
    }
}

extension ExchangeView {
    var exchangeName: some View {
        VStack(alignment: .leading) {
            Text(exchange.name)
                .font(.headline)
                .foregroundStyle(Constants.Colors.foregroundColor)
                .fontWeight(.semibold)
            
            if let yearEst = exchange.yearEstablished {
                Text(String(yearEst))
                    .font(.subheadline).bold()
                    .foregroundStyle(Constants.Colors.secondaryColor)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var trustScore: some View {
        VStack(alignment: .trailing) {
            Text("\(String(exchange.trustScore))/10")
                .font(.headline)
                .foregroundStyle(Constants.Colors.foregroundColor)
                .fontWeight(.semibold)
        }
    }
    
}

#Preview {
    ExchangeView(exchange: CGMock().bybit)
}
