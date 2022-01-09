import SwiftUI
import HealthKit

struct RequestHealthAccessButtonView: View {
    let healthStore = HKHealthStore()
    
    
    let writeTypes = Set([HKClinicalType.workoutType(),
                        HKObjectType.quantityType(forIdentifier: .height)!])
    let readTypes = Set([HKObjectType.workoutType(),
                        HKObjectType.quantityType(forIdentifier: .heartRate)!])



    var body: some View {
        VStack {
            Button {
                healthStore.requestAuthorization(toShare: writeTypes, read: readTypes)
                { (success, error) in }
            }
        label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .frame(width: 350, height: 70)
                    .foregroundColor(.red)
                HStack {
                    Image(systemName: "heart.text.square")
                        .foregroundColor(.white)
                        .font(.system(size: 45, weight:  .regular))
                    Text("Click here to grant health data access")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight:  .regular))
                    Image(systemName: "heart.text.square")
                        .foregroundColor(.white)
                        .font(.system(size: 45, weight:  .regular))
                }
            }
        }
        }
    }
}

struct RequestHealthAccessButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RequestHealthAccessButtonView()
    }
}
