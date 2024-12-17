//
//  genericConst.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/07/2024.
//

import Foundation

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
