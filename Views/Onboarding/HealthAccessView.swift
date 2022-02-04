import SwiftUI
import NavigationStack
import HealthKit

private var showNextButton = false

let healthStore = HKHealthStore()

let writeTypes = Set([HKObjectType.quantityType(forIdentifier: .height)!,])

let readTypes = Set([ HKObjectType.quantityType(forIdentifier: .bloodGlucose)!,
                      HKObjectType.quantityType(forIdentifier: .heartRate)!,
                      HKObjectType.quantityType(forIdentifier: .height)!])

struct HealthAccessView: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(.white)
                        .frame(width: 360, height: 500)
                    VStack {
                        Text("Health Data Access:")
                            .foregroundColor(.black)
                            .font(.system(size: 35, weight: .regular))
                            .italic()
                            .underline()
                            .padding(-6)
                        Text("We require health data to make this app function as intended. Not comfortable with a certain catagory? You can disable our access at sturdy-sniffle.jaspermayone.com/permission-change")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .regular))
                            .italic()
                            .padding(4)
                        Text("For more information about why we require the permisons we do, visit sturdy-sniffle.jaspermayone.com/permissions.")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .regular))
                            .italic()
                            .padding(4)
                    }
                    .padding()
                }
                Button{
                    if HKHealthStore.isHealthDataAvailable() {
                        healthStore.requestAuthorization(toShare: writeTypes, read: readTypes) { (success, error) in
                            if success {
                                let calendar = NSCalendar.current
                                
                                var anchorComponents = calendar.dateComponents([.day, .month, .year, .weekday], from: NSDate() as Date)
                                
                                let offset = (7 + anchorComponents.weekday! - 2) % 7
                                
                                anchorComponents.day! -= offset
                                anchorComponents.hour = 2
                                
                                guard let anchorDate = Calendar.current.date(from: anchorComponents) else {
                                    fatalError("*** unable to create a valid date from the given components ***")
                                }
                                
                                let interval = NSDateComponents()
                                interval.minute = 30
                                
                                let endDate = Date()
                                
                                guard let startDate = calendar.date(byAdding: .month, value: -1, to: endDate) else {
                                    fatalError("*** Unable to calculate the start date ***")
                                }
                                
                                guard let quantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate) else {
                                    fatalError("*** Unable to create a step count type ***")
                                }
                                
                                let query = HKStatisticsCollectionQuery(quantityType: quantityType,
                                                                        quantitySamplePredicate: nil,
                                                                        options: .discreteAverage,
                                                                        anchorDate: anchorDate,
                                                                        intervalComponents: interval as DateComponents)
                                
                                query.initialResultsHandler = {
                                    query, results, error in
                                    
                                    guard let statsCollection = results else {
                                        fatalError("*** An error occurred while calculating the statistics: \(String(describing: error?.localizedDescription)) ***")
                                    }
                                    statsCollection.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
                                        if let quantity = statistics.averageQuantity() {
                                            let date = statistics.startDate
                                            //for: E.g. for steps it's HKUnit.count()
                                            let value = quantity.doubleValue(for: HKUnit(from: "count/min"))
                                            print("done")
                                            print(value)
                                            print(date)
                                        }
                                    }
                                }
                                healthStore.execute(query)
                            } else {
                                print("Authorization failed")
                            }
                        }
                    } else {
                        print("No HealthKit data available")
                    }
                } label: {
                    ZStack {
                        HStack {
                            Image(systemName: "heart.text.square")
                                .foregroundColor(.black)
                                .font(.system(size: 55, weight:  .light))
                                .padding(.leading, 2 )
                            VStack {
                                Text("Health Access")
                                    .foregroundColor(.black)
                                    .font(.system(size: 32, weight:  .semibold))
                                    .italic()
                            }
                            .padding(2)
                            Image(systemName: "heart.text.square")
                                .foregroundColor(.black)
                                .font(.system(size: 55, weight:  .light))
                                .padding(.trailing, 2 )
                        }
                    }
                }
                .padding(.horizontal, 3)
                .background(.white)
                .cornerRadius(25)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color("MainColor"))
        }
    }
}

struct HealthAccessView_Previews: PreviewProvider {
    static var previews: some View {
        HealthAccessView()
    }
}
