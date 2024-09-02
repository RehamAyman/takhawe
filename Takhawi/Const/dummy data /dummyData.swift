//
//  dummyData.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/11/2023.
//

import Foundation



struct reviewsModel {
    let username : String
    let userPhoto : String
    let review : Double
    let comment : String
   
}


struct dummyPaymentMethods {
    let icon : String
    let number : String
    let expireIn : String 
    let type : String
    var selected : Bool 
    let id : paymentMethod
}


struct dummyOffer {
    let driverPhoto : String
    let driverRate : Double
    let driverName : String
}
struct dummyNotification {
    let day : String
    var data : [NotificationData]
}


struct NotificationData {
    let icon : String
    let title : String
    let subtitle : String
}



struct dummyActivity  {
    let icon : String
    let name : String
    let id : Int
    
  
}



struct dummyFilterData {
    let name : String
    var selected : Bool = false 
}



struct dummyLocations {
    let location : String
    let locationDetails : String
}




let dummyCancelationResons  : [String] = [
    "Waiting for long time".localize ,
"Driver denied to go to destination".localize ,
"Unable to contact driver".localize ,
"Driver denied to come to pickup".localize ,
"Wrong address shown".localize ,
"The price is not reasonable".localize


]


let dummyReportResons : [String] = [
    "Waiting for long time".localize ,
    "Driver denied to go to destination".localize ,
    "Driver denied to come to pickup".localize ,
    "Unable to contact driver".localize ,
    "Wrong address shown".localize ,
    "The price is not reasonable".localize


]





struct  offerLocation  {
    let CurrentLat  : Double
    let currentLng : Double
    let desLat : Double
    let destLng : Double
    let currentAddress : String
    let destAddress : String
}
