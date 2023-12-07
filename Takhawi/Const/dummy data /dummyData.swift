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



struct dummyFilterData {
    let name : String
    var selected : Bool = false 
}
