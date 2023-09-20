//
//  NSNotificationNames.swift
//  WritingService
//
//  Created by Sara Mady on 13/03/2023.
//

import Foundation

extension NSNotification.Name {

    /*
     Enum for Holding all strings keys as rawValues to avoid using Strings
     */
    private enum Names: String {
        case isLoginChanged
        case reloadHomeTableView
        case reloadMyDeliveryTableView
        case reloadMyOrderTableView
        case reloadUserOrderDetails
        case reloadProviderOrderDetails
        case reloadProviderTableView
        case reloadDelegateOrderDetails
        case reloadDelegateDeliveryOrderDetails
        case reloadNotificationCount
        case reloadNotificationFromFCM
        case disConnectSocket
        case reloadRenewOffer
    }

    /*
     All Notification cases
     */

    static let isLoginChanged = Notification.Name(rawValue: Names.isLoginChanged.rawValue)
    static let reloadHomeTableView = Notification.Name(rawValue: Names.reloadHomeTableView.rawValue)
    static let reloadMyDeliveryTableView = Notification.Name(rawValue: Names.reloadMyDeliveryTableView.rawValue)
    static let reloadMyOrderTableView = Notification.Name(rawValue: Names.reloadMyOrderTableView.rawValue)
    static let reloadUserOrderDetails = Notification.Name(rawValue: Names.reloadUserOrderDetails.rawValue)
    static let reloadProviderOrderDetails = Notification.Name(Names.reloadProviderOrderDetails.rawValue)
    static let reloadProviderTableView = Notification.Name(Names.reloadProviderTableView.rawValue)
    static let reloadDelegateOrderDetails = Notification.Name(rawValue: Names.reloadDelegateOrderDetails.rawValue)
    static let reloadDelegateDeliveryOrderDetails = Notification.Name(rawValue: Names.reloadDelegateDeliveryOrderDetails.rawValue)
    static let reloadNotificationCount = Notification.Name(rawValue: Names.reloadNotificationCount.rawValue)
    static let reloadNotificationFromFCM = Notification.Name(rawValue: Names.reloadNotificationFromFCM.rawValue)
    static let disConnectSocket = Notification.Name(Names.disConnectSocket.rawValue)
    static let reloadRenewOffer = Notification.Name(Names.reloadRenewOffer.rawValue)
}
