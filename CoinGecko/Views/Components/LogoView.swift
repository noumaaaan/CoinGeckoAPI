import SwiftUI

struct LogoView: View {
    
    let urlString: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Circle()
                .fill(.gray)
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    LogoView(urlString: CGCoinMock().bitcoin.image, width: 60, height: 60)
}
