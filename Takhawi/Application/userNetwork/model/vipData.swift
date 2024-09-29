//
//  vipData.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/07/2024.
//

import Foundation



struct vipData : Codable {
    let id : Int?
    let start_date : String?
    let end_date : String?
    let status : String?
    let price : Int?
    let gender : String?
    let type : String?
    let createdAt : String?
    let updatedAt : String?
    let deletedAt : String?
    let features : [String]?
    let driver_id : String?
    let vIP_Trip : VIP_Trip?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case start_date = "start_date"
        case end_date = "end_date"
        case status = "status"
        case price = "price"
        case gender = "gender"
        case type = "type"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case deletedAt = "deletedAt"
        case features = "features"
        case driver_id = "driver_id"
        case vIP_Trip = "VIP_Trip"
    }

  

}



struct VIP_Trip : Codable {
    let pickup_location_lat : Double?
    let pickup_location_lng : Double?
    let distination_location_lat : Double?
    let distination_location_lng : Double?
    let app_share_discount : Int?
    let payment_status : String?
    let payment_method : String?
    let passnger_id : Int?
    let trip_id : Int?
    let createdAt : String?
    let updatedAt : String?
    let destination_description : String?
    let pickup_description : String?//pickup_description
    
    enum CodingKeys: String, CodingKey {

        case pickup_location_lat = "pickup_location_lat"
        case pickup_location_lng = "pickup_location_lng"
        case distination_location_lat = "destination_location_lat"
        case distination_location_lng = "destination_location_lng"
        case app_share_discount = "app_share_discount"
        case payment_status = "payment_status"
        case payment_method = "payment_method"
        case passnger_id = "passnger_id"
        case trip_id = "trip_id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case destination_description = "destination_description"
        case pickup_description = "pickup_description"
    }

    

}



struct SocketVIP_Trip : Codable {
    let pickup_location_lat : Double?
    let pickup_location_lng : Double?
    let distination_location_lat : Double?
    let distination_location_lng : Double?
    let app_share_discount : Int?
    let payment_status : String?
    let payment_method : String?
    let passnger_id : Int?
    let trip_id : Int?
    let createdAt : String?
    let updatedAt : String?
    let destination_description : String?
    let pickup_description : String?//pickup_description
    let features : [String]?
    let passenger_name : String?
    let passenger_rate : Double?
    let passenger_avatar : String?
    
    enum CodingKeys: String, CodingKey {

        case pickup_location_lat = "pickup_location_lat"
        case pickup_location_lng = "pickup_location_lng"
        case distination_location_lat = "destination_location_lat"
        case distination_location_lng = "destination_location_lng"
        case app_share_discount = "app_share_discount"
        case payment_status = "payment_status"
        case payment_method = "payment_method"
        case passnger_id = "passnger_id"
        case trip_id = "trip_id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case destination_description = "destination_description"
        case pickup_description = "pickup_description"
        case features = "features"
        case passenger_name = "passenger_name"
        case passenger_rate = "passenger_rate"
        case passenger_avatar = "passenger_avatar"
    }

    

}
