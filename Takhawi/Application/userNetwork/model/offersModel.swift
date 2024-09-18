//
//  offersModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/07/2024.
//

import Foundation
struct offerResult : Codable {
    let id : Int?
    let price : Double?
    let app_share_discount : Int?
    let status : String?
    let features : [String]?
    let driver_id : Int?
    let trip_id : Int?
    let createdAt : String?
    let driver : Driver?
    let Vehicle_Color : itemObj?
    let Vehicle_Class : itemObj?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case price = "price"
        case app_share_discount = "app_share_discount"
        case status = "status"
        case features = "features"
        case driver_id = "driver_id"
        case trip_id = "trip_id"
        case createdAt = "createdAt"
        case driver = "Driver"
        case Vehicle_Color = "Vehicle_Color"
        case Vehicle_Class = "Vehicle_Class"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        app_share_discount = try values.decodeIfPresent(Int.self, forKey: .app_share_discount)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        features = try values.decodeIfPresent([String].self, forKey: .features)
        driver_id = try values.decodeIfPresent(Int.self, forKey: .driver_id)
        trip_id = try values.decodeIfPresent(Int.self, forKey: .trip_id)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        driver = try values.decodeIfPresent(Driver.self, forKey: .driver)
        Vehicle_Color = try values.decodeIfPresent(itemObj.self, forKey: .Vehicle_Color)
        Vehicle_Class = try values.decodeIfPresent(itemObj.self, forKey: .Vehicle_Class)
    }

}
struct Driver : Codable {
    let name : String?
    let avatar : String?
    let driver_rate : Double?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case avatar = "avatar"
        case driver_rate = "driver_rate"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        driver_rate = try values.decodeIfPresent( Double.self , forKey: .driver_rate)
    }

}

//itemObj
struct itemObj : Codable {
    let name : String?
    

    enum CodingKeys: String, CodingKey {

        case name = "name"
       
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
       
    }

}
