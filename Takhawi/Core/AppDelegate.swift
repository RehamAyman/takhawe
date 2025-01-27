//
//  AppDelegate.swift
//  Takhawi
//
//  Created by Sara Mady on 11/07/2023.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Intercom
import FirebaseCore
import UserNotifications
import FirebaseMessaging






@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var window: UIWindow?
    static let appGroupKey = "group.HomeCooking"
    let gcmMessageIDKey = "gcm.message_id"
    static var FCMToken = "xnx'_'xnx"
    static let GoogleAPI = "AIzaSyAfTSBkcXfJa5Zf0YHN3-m-gJFFhvzVu4U" // "AIzaSyBaLRq-LbUQmWZkJkfwjWcJyoxWlhyQ35s"
    var location:CLLocationManager?
    let socketManager = MySocketManager()
    
   
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        self.handleFCMFor(application)
        
        GMSServices.provideAPIKey("AIzaSyAfTSBkcXfJa5Zf0YHN3-m-gJFFhvzVu4U")
        GMSPlacesClient.provideAPIKey("AIzaSyAfTSBkcXfJa5Zf0YHN3-m-gJFFhvzVu4U")
        self.location?.requestAlwaysAuthorization()
        self.location?.requestWhenInUseAuthorization()
        AppDelegate.window?.tintColor = UIColor(named: colors.mainColor.rawValue)
        Intercom.setBottomPadding(90)
      
        Intercom.setApiKey("ios_sdk-e6a2bb07aa9d964c423aca0f19b83e7288022f6e", forAppId: "yqdxwqwt")
        Intercom.setLauncherVisible(false )
       

        let ic = ICMUserAttributes()
        ic.email = UserDefaults.user?.user?.email ?? ""
        ic.name = UserDefaults.user?.user?.name ?? ""
        ic.phone = UserDefaults.user?.user?.phone ?? ""
        Intercom.loginUser(with: ic ) { result  in
            print("🤠🤠🤠🤠")
            print(result)
        }
       
        print("🤠 userToken: \(UserDefaults.user?.accessToken ?? "-- no saved token --" )")
        self.showRateFormAfterTripEnds()
  
        return true
    }
    
    
    
    
    
    private func showRateFormAfterTripEnds () {
        
        if UserDefaults.user?.user?.role == role.user.rawValue {
            socketManager.connect()
            socketManager.listenToTripStatus { status   in
                print("🥳🥳🥳🥳🥳🥳🥳🥳🥳")
                print(status)
                if status.status == "COMPLETED" { // show rate view COMPLETED
                    let vc = rateTheDriverVC()
                    vc.driverId = status.driverId ?? 0
                    vc.tripId = status.tripId ?? 0
                    if let rootViewController = AppDelegate.window?.rootViewController {
                        rootViewController.present( vc , animated: true, completion: nil )
                    }
                }
            }
        }
    }
 
    
    
 
    
    private func handleFCMFor(_ application: UIApplication) {
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in })
        application.registerForRemoteNotifications()
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
    }
    
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
 
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        return false 
    }
    
}


