//
//  PushNotifcations.swift
//  ShipToEX
//
//  Created by AAIT Company on 26/06/2022.
//

import Firebase
import UIKit
extension AppDelegate: MessagingDelegate {
    // [START refresh_token]
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("🔔Firebase registration token🔔: \(fcmToken ?? "No Devies token found")")
        AppDelegate.FCMToken = fcmToken ?? "No Token Found"
    }
}

enum notificationType: String {
    // common
    case projectAccepted = "project_accepted"
    case projectWaitingAcceptOffer = "project_waiting_for_accept_offer"
    case projectInProgress = "project_in_progress"
    case projectWriterFinish = "project_writer_finish"
    case projectFinished = "project_finished"
    case newMessage = "new_message"
    case delete_user
    case block

}
enum FCMValueKeys: String {
    case type
    case roomId = "roomId"
    case sender = "sender_id"
}

extension AppDelegate: UNUserNotificationCenterDelegate {

    static var isOpenNotification = false

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Unable to register for remote notifications: \(error.localizedDescription)")
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

        print("🔔APNs token retrieved:🔔 \(deviceToken)")
    }

    // MARK: - Handel the arrived Notifications

    // MARK: - Use this method to process incoming remote notifications for your app

    // when fcm comes
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
    }

    func resetApp() {
       // let language = LocalizationManager.shared.getLanguage()

//        SocketConnection.sharedInstance.socket.off("sendMessage")

//        SocketConnection.sharedInstance.socket.disconnect()

        UserDefaults.standard.removeObject(forKey: "token")
        defult.shared.removeAll()
        //Language.setAppLanguage(lang: language)
        defult.shared.setData(data: false, forKey: .isFiristLuanch)

//        guard let window = UIApplication.shared.keyWindow else { return }
//        let vc = AppStoryboards.Main.viewController(LoginViewController.self)
//        let nav = CustomNavigationController(rootViewController: vc)
//
//        window.rootViewController = nav
//        UIView.transition(with: window, duration: 0.5, options: .showHideTransitionViews, animations: nil, completion: nil)
    }

    // MARK: - ============================ when Show Notification ==========================

    // when the notification arrives and the app is in forground

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        print("Notification info is: \n\(userInfo)")

        guard let targetValue = userInfo[AnyHashable("type")] as? String else { return }

        switch targetValue {
        case notificationType.block.rawValue:
            self.resetApp()
        case notificationType.delete_user.rawValue:
            self.resetApp()

        default:
            print("FCM case not found ❌")
        }

        completionHandler([.list, .banner, .sound])
    }

    // MARK: - ============================ User must tap ==========================

    // when the user tap on the notification banar background
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        print("Notification info is: \n\(userInfo)")
        guard let targetValue = userInfo[AnyHashable("key")] as? String else { return }
        let orderID = userInfo[AnyHashable("order_id")] as? String
        let roomID = userInfo[AnyHashable("room_id")] as? String ?? ""
        let reciverID = userInfo[AnyHashable("receiver_id")] as? String ?? ""
        let senderID = userInfo[AnyHashable("sender")] as? String

        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let root = window?.rootViewController as? BaseNav else { return }

//        let home = root.viewControllers?[0] as! BaseNav
//        root.selectedIndex = 0
//        root.navigationController?.popToRootViewController(animated: true)
//        let currentVC = home.visibleViewController

        print("Notification Tapped from forground 📱🔔")
        print("Notification Type 🥶 \(targetValue)")

//        switch targetValue {
//        case notificationType.newMessage.rawValue:
////            if currentVC?.isKind(of: ChatVC.self) == false {
////                let vc = ChatVC.create(roomId: Int(roomID) ?? 0, reciverId: Int(reciverID) ?? 0, senderId: defult.shared.user()?.id ?? 0)
////                root.pushViewController(vc, animated: true)
//            
//        default:
//            print("FCM case not found ❌")
//        }

//        UIApplication.shared.applicationIconBadgeNumber = 0
        completionHandler()
    }
}
