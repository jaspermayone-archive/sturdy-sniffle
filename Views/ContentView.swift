import SwiftUI
import SwiftUICharts
import Indicators
import HealthKit

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hey")
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color("MainColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
