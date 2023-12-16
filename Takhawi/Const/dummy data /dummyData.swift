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




struct dummyFilterData {
    let name : String
    var selected : Bool = false 
}






let dummyCancelationResons  : [String] = [
"Waiting for long time" ,
"Driver denied to go to destination" ,
"Unable to contact driver" ,
"Driver denied to come to pickup" ,
"Wrong address shown" ,
"The price is not reasonable"


]


let dummyReportResons : [String] = [
"Waiting for long time" ,
"Driver denied to go to destination" ,
"Driver denied to come to pickup" ,
"Unable to contact driver" , 
"Wrong address shown" ,
"The price is not reasonable"


]

