//
//  AppDelegate.swift
//  Takhawi
//
//  Created by Sara Mady on 11/07/2023.
//

import UIKit
import GoogleMaps
import GooglePlaces



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var window: UIWindow?
    static let appGroupKey = "group.HomeCooking"
    let gcmMessageIDKey = "gcm.message_id"
    static var FCMToken = "xnx'_'xnx"
    static let GoogleAPI = "AIzaSyALVzDd_-YceNQIpzRFq0w60jTU3RhV22I"
    var location:CLLocationManager?
    
   
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
    //AIzaSyDS61p6luMp1Kfj8xmfIvjYz-mBQF9Noo8 // hayah
    //AIzaSyA7nhBa7YZtIb6KoG47O0_y2PwxYfsHiBs // ageeba
        
        GMSServices.provideAPIKey("AIzaSyA7nhBa7YZtIb6KoG47O0_y2PwxYfsHiBs")
        GMSPlacesClient.provideAPIKey("AIzaSyA7nhBa7YZtIb6KoG47O0_y2PwxYfsHiBs")
        
        AppDelegate.window?.tintColor = UIColor(named: "MainColor")
        self.location?.requestAlwaysAuthorization()
        self.location?.requestWhenInUseAuthorization()
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    
      
        
        
        
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


