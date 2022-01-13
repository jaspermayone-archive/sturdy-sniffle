import SwiftUI
import CareKitUI
import CareKit
import CareKitStore

struct WelcomeScreenView: View {
    
    var body: some View {
        VStack {
            Text("hey!")
                .foregroundColor(.white)
            Spacer()
        }
        .padding(100)
        .background(Image("mainBackround").resizable().aspectRatio(contentMode: .fill)).edgesIgnoringSafeArea(.all)
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
