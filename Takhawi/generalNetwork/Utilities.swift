//
//  Utilities.swift
//
//  Created by AAIT
//

import UIKit

//let deviceId = UserDefaults.pushNotificationToken ?? "no device id for firebase for this device and this is an ios device"

let uuid = UIDevice.current.identifierForVendor?.uuidString ?? String()
let deviceType = "ios"

let defaultLat = "23.8859"
let defaultLong = "45.0792"
