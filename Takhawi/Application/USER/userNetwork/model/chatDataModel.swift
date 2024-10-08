//
//  chatDataModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/04/1446 AH.
//

import Foundation


struct ChatDataModelResult : Codable {
    let id : String?
    let userId : Int?
    let driverId : Int?
    let tripId : Int?
    let is_active : Bool?
    let driver : ChatDriver?
    let countNum : countNum?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case userId = "userId"
        case driverId = "driverId"
        case tripId = "tripId"
        case is_active = "is_active"
        case driver = "Driver"
        case countNum = "_count"
    }


}
struct countNum : Codable {
    let messages : Int?

    enum CodingKeys: String, CodingKey {

        case messages = "Messages"
    }


}


struct ChatDriver : Codable {
   
    let name : String?
    let avatar : String?
    let driver_rate : Double?
   
   

    enum CodingKeys: String, CodingKey {
     
        case name = "name"
        case avatar = "avatar"
        case driver_rate = "driver_rate"
      
        
       
    }


}


