import SwiftUI
import SwiftUICharts
import Indicators
import HealthKit

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .background(Image("3788808").resizable().aspectRatio(contentMode: .fill)).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
