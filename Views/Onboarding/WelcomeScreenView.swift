import SwiftUI
import NavigationStack

struct WelcomeScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("hey!")
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color("MainColor"))
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
