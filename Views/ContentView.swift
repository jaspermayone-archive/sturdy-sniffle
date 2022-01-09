import SwiftUI
import CoreData
import CareKit
import CareKitUI
import CareKitStore
import HealthKit
import HealthKitUI

let healthStore = HKHealthStore()


struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.teal)
                    .frame(width: 500, height: 480)
                VStack {
                    HStack {
                        Image(systemName: "tray.circle.fill")
                            .font(.system(size: 40, weight:  .semibold))
                            .foregroundColor(.white)
                            .padding(.trailing, 20)
                        Text("Welcome")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight:  .semibold))
                            .frame(alignment: .center)
                        Text("User!")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight:  .semibold))
                            .frame(alignment: .center)
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 40, weight:  .semibold))
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                    }
                    .padding(.top, 130)
                    .padding(.bottom)
                    VStack {
                        HStack {
                            Image(systemName: "figure.walk.circle.fill")
                                .font(.system(size: 30, weight:  .regular))
                                .foregroundColor(.white)
                            Text("Total Steps:")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight:  .regular))
                            Text("DATA")
                                .foregroundColor(.red)
                                .font(.system(size: 20, weight:  .light)).italic()
                        }
                        HStack {
                            Image(systemName: "heart.circle.fill")
                                .font(.system(size: 30, weight:  .regular))
                                .foregroundColor(.white)
                            Text("Heart Rate:")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight:  .regular))
                            Text("DATA")
                                .foregroundColor(.red)
                                .font(.system(size: 20, weight:  .light)).italic()
                        }
                        HStack {
                            Image(systemName: "bed.double.circle.fill")
                                .font(.system(size: 30, weight:  .regular))
                                .foregroundColor(.white)
                            Text("Sleep:")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight:  .regular))
                            Text("DATA")
                                .foregroundColor(.red)
                                .font(.system(size: 20, weight:  .light)).italic()
                        }
                    }
                    .frame(alignment: .leading)
                }
                .padding(.top, 40)
            }
            .padding(.top, -555)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
