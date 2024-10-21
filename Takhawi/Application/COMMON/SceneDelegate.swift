//
//  SceneDelegate.swift
//  Takhawi
//
//  Created by Sara Mady on 11/07/2023.
//

import UIKit
import IQKeyboardManagerSwift




class SceneDelegate: UIResponder, UIWindowSceneDelegate   {
   
    override init() {
        super.init()
        UIFont.overrideInitialize()
    }
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarTintColor = UIColor(named: "MainColor")
        LocalizationManager.shared.delegate = self
        LocalizationManager.shared.setAppInnitLanguage()
    }
    
//    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//        if let url = URLContexts.first?.url {
//            print("⌛️⌛️⌛️⌛️ comming url : \(url)")
//            let urlString = url.absoluteString
//            let component = urlString.components(separatedBy: "=")
//            if component.count > 1 , let tripId = component.last {
//                print("⌛️⌛️⌛️⌛️ comming tripId is  : \(tripId)")
//                self.navigateToTripDetails()
//            }
//        }
//    }
//  
    
    
    
//    private func navigateToTripDetails () {
//       // let item = self.allTrips[indexPath.row]
//        let vc = driverProfileVC()
//        vc.comeFromSharedUrl = true
//        let nav = CustomNavigationController(rootViewController: vc)
//        AppHelper.changeWindowRoot(vc: nav)
//      
//             
//        
//    }
//    
   
    
    
}



extension SceneDelegate : LocalizationDelegate {
    func resetApp() {
        UIFont.overrideInitialize()
        guard let window = window else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "OnboardingViewController")
        window.rootViewController = vc
        let options: UIView.AnimationOptions = .transitionFlipFromLeft
        let duration: TimeInterval = 0.4
        UIView.transition(with: window, duration: duration, options: options, animations: nil, completion: nil)
        
     
            
         UIFont.overrideInitialize()
        
        
    }
}







