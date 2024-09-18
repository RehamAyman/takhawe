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



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var window: UIWindow?
    static let appGroupKey = "group.HomeCooking"
    let gcmMessageIDKey = "gcm.message_id"
    static var FCMToken = "xnx'_'xnx"
    static let GoogleAPI = "AIzaSyAfTSBkcXfJa5Zf0YHN3-m-gJFFhvzVu4U" // "AIzaSyBaLRq-LbUQmWZkJkfwjWcJyoxWlhyQ35s"
    var location:CLLocationManager?
    
   
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
        
        GMSServices.provideAPIKey("AIzaSyAfTSBkcXfJa5Zf0YHN3-m-gJFFhvzVu4U")
        GMSPlacesClient.provideAPIKey("AIzaSyAfTSBkcXfJa5Zf0YHN3-m-gJFFhvzVu4U")
        self.location?.requestAlwaysAuthorization()
        self.location?.requestWhenInUseAuthorization()
        AppDelegate.window?.tintColor = UIColor(named: "MainColor")
        
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
  // check here  if authenticated User go to home else go to auth cycle
        return true
    }
    
    
    
    
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    
    
    

}


