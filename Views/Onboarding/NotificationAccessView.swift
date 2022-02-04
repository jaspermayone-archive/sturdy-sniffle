import SwiftUI
import NavigationStack

private var showNextButton = false
private var nextButtonClicked = false

func requestNotificationPerms() -> Void {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        
        if error != nil {
            print("Notification ERR!")
        }
        // Do stuff like toggle
    }
}

struct NotificationAccessView: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(.white)
                        .frame(width: 360, height: 500)
                    VStack {
                        Text("Notifications Access:")
                            .foregroundColor(.black)
                            .font(.system(size: 35, weight: .regular))
                            .italic()
                            .underline()
                            .padding(-6)
                        Text("We use notifications to alert you about trends we find, and when doctors add data. Not comfortable with notifications? You can disable them by clicking no on the request.")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .regular))
                            .italic()
                            .padding(4)
                        Text("For more information about what notifications we send, and to coustomize what notifications you get, visit sturdy-sniffle.jaspermayone.com/notificatons.")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .regular))
                            .italic()
                            .padding(4)
                    }
                    .padding()
                }
                Button(action: requestNotificationPerms) {
                    ZStack {
                        HStack {
                            Image(systemName: "rectangle.3.group.bubble.left")
                                .foregroundColor(.black)
                                .font(.system(size: 45, weight:  .light))
                                .padding(.leading, 2 )
                            VStack {
                                Text("Notifications")
                                    .foregroundColor(.black)
                                    .font(.system(size: 32, weight:  .semibold))
                                    .italic()
                            }
                            Image(systemName: "rectangle.3.group.bubble.left")
                                .foregroundColor(.black)
                                .font(.system(size: 45, weight:  .light))
                                .padding(.trailing, 2 )
                        }
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(25)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color("MainColor"))
        }
    }
}

struct NotificationAccessView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationAccessView()
    }
}
