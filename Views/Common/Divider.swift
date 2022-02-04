import SwiftUI

struct Divider: View {
    
    var dividerColor: Color
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .frame(width: 365, height: 10)
                .foregroundColor(dividerColor)
        }
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            Divider(dividerColor: .black)
            Spacer()
            Divider(dividerColor: .white)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color("MainColor"))
    }
}
