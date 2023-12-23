//
//  sideMenuItems.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/10/2023.
//

import Foundation
struct publicSideMenu {
   static let items : [sideMenuDataModel]  = [
        
        sideMenuDataModel(name: "Switch to Driver", icon: "side2") ,
        sideMenuDataModel(name: "Personal Info", icon: "side1") ,
        sideMenuDataModel(name: "Notification", icon: "side3")  ,
        sideMenuDataModel(name: "Messages", icon: "side4") ,
        sideMenuDataModel(name: "Favorite", icon: "side5") ,
        sideMenuDataModel(name: "Wallet", icon: "side6") ,
        sideMenuDataModel(name: "Trips", icon: "side7") ,
        sideMenuDataModel(name: "Settings", icon: "side8")
    ]
    
    
    
    static func sideMenuView ( index : IndexPath , main : BaseVC) {
        switch index.row {
       
        case 0 :  // switch to driver acc
            print("go to switch to driver ")
        case 1 : // go to profile
            let vc = profileVC()
            main.push(vc)
        case 2 : // go to notifications
            let vc = notificationViewVC()
            main.push(vc)
        case 3 : // go to messages
            print("go to messages vc ")
            let vc = messagesViewVC()
            main.push(vc)
        case 4 : // go to favorites
            let vc = favoritesVC()
            main.push(vc)
        case 5: // go to wallet
            let vc = walletVC()
            main.push(vc)
        case 6 : // go to trips
            let vc = tripsSideMenuVC()
            main.push(vc)
        case 7 : // go to settings
        let vc = settingsSideVC()
            main.push(vc)
            
        default:
            break
        }
    }
}
