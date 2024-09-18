//
//  ExtensionNotification.swift
//  WritingService
//
//  Created by Sara Mady on 05/05/2023.
//

import Foundation
extension Notification.Name {
    static let goToCart = Notification.Name(
        rawValue: "goToCart")

    static let myPurchases = Notification.Name(
        rawValue: "myPurchases")

    static let reloadMyPurchases = Notification.Name(
        rawValue: "reloadMyPurchases")

    static let reloadMyOrders = Notification.Name(
        rawValue: "reloadMyOrders")

   
    
    static let updateHomeProfile = Notification.Name("customNotification")
    
  
    
}
