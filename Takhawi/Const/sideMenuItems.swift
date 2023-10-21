//
//  sideMenuItems.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/10/2023.
//

import Foundation
struct publicSideMenu {
   static let items : [sideMenuDataModel]  = [
        sideMenuDataModel(name: "Home", icon: "home 1") ,
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
        case 0 :print( "go to home")
           
        case 1 : print("go to switch to driver ")
        case 2 :
            let vc = profileVC() // go to profile
            main.push(vc)
        default:
            break
        }
    }
}
