import SwiftUI
import NavigationStack
import SlideOverCard
import XCTest

struct PermissionView: View {
    
    @State var navToMain: Bool = false
    
    var body: some View {
        ZStack {
            Color("MainColor")
            
            // Use https://github.com/joogps/SlideOverCard
            
            /*
             .slideOverCard(item: $activeCard) { item in
             switch item {
             case .notificationAccess:
             NotificationAccessView()
             case .healthAccess:
             HealthAccessView()
             default:
             WelcomeScreenView()
             }
             }
             */
            
            
            /*
             .slideOverCard(item: $activeCard, onDismiss: {self.navToMain.toggle()}, options: [.disableDrag, .disableDragToDismiss]) {
             }
             */
        }
    }
}

struct PermissionView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionView()
    }
}
