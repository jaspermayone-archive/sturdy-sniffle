import SwiftUI

struct Divider: View {
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 30, height: 30)).frame(width: 365, height: 10)
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        Divider()
    }
}
