import SwiftUI
import SwiftUICharts
import Indicators
import HealthKit

let healthStore = HKHealthStore()

struct ContentView: View {
    var body: some View {
        if HKHealthStore.isHealthDataAvailable() {
            VStack {
RequestHealthAccessView()
            }
            //            } else {
            //                VStack {
            //                    ZStack {
            //                        Circle()
            //                            .fill(Color.teal)
            //                            .frame(width: 500, height: 400)
            //                        VStack {
            //                            HStack {
            //                                Image(systemName: "tray.circle.fill")
            //                                    .font(.system(size: 40, weight:  .semibold))
            //                                    .foregroundColor(.white)
            //                                Text("Welcome")
            //                                    .foregroundColor(.white)
            //                                    .font(.system(size: 30, weight:  .semibold))
            //                                    .frame(alignment: .center)
            //                                Text("User!")
            //                                    .foregroundColor(.white)
            //                                    .font(.system(size: 30, weight:  .semibold))
            //                                    .frame(alignment: .center)
            //                                Image(systemName: "person.crop.circle.fill")
            //                                    .font(.system(size: 40, weight:  .semibold))
            //                                    .foregroundColor(.white)
            //                            }
            //                            .padding(.top, 130)
            //                            .padding(.bottom)
            //                        }
            //                        .padding(.top, 10)
            //                    }
            //                    .padding(.top, -555)
            //
            //                    VStack {
            //                        //       LineChart(chartData: LineChartData)
            //                    }
            //
            //                }
            //
            //            }
            
        } else {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 40, weight:  .medium))
                
                Text("NOT AVAIBLE ON THIS DEVICE")
                    .foregroundColor(.red)
                    .font(.system(size: 30, weight:  .medium))
                
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 40, weight:  .medium))
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
