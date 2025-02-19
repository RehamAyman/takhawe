//
//  genericConst.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/07/2024.
//

import Foundation
import UIKit

import AudioToolbox

enum role : String {
    case user = "USER"
    case driver = "DRIVER"
}

enum driverStatus {
    
    case Register
    case UploadId
    case CarLicence
    case driverLicence
    case profilePhoto
    case VINnumber
    case carNumber
    case carPhotos
    case carInfo
}


enum tripType : String {
    case vip = "VIP"
    case basic = "BASIC"
}

//completed


enum tripStatus : String {
    
    
case comming  = "UPCOMING"
case onWay = "ON_WAY"
case arrived  = "ARRIVED"
case inProgress = "INPROGRESS"
case cancelled = "CANCELLED"
case completed = "COMPLETED"
}

enum STATUS : String {
    case REJECTED
    case PENDING
    case REGISTERED
    case APPROVED
}


enum reportaccedint {
    case radar
    case animal
    case accident
    case changeDirection
    case alert
    case speed
    case work
    
}


enum Vibration {
      case error
      case success
      case warning
      case light
      case medium
      case heavy
      @available(iOS 13.0, *)
      case soft
      @available(iOS 13.0, *)
      case rigid
      case selection
      case oldSchool

      public func vibrate() {
          switch self {
          case .error:
              UINotificationFeedbackGenerator().notificationOccurred(.error)
          case .success:
              UINotificationFeedbackGenerator().notificationOccurred(.success)
          case .warning:
              UINotificationFeedbackGenerator().notificationOccurred(.warning)
          case .light:
              UIImpactFeedbackGenerator(style: .light).impactOccurred()
          case .medium:
              UIImpactFeedbackGenerator(style: .medium).impactOccurred()
          case .heavy:
              UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
          case .soft:
              if #available(iOS 13.0, *) {
                  UIImpactFeedbackGenerator(style: .soft).impactOccurred()
              }
          case .rigid:
              if #available(iOS 13.0, *) {
                  UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
              }
          case .selection:
              UISelectionFeedbackGenerator().selectionChanged()
          case .oldSchool:
              AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
          }
      }
  }


