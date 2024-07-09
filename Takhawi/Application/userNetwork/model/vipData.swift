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
    let price : String?
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

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        deletedAt = try values.decodeIfPresent(String.self, forKey: .deletedAt)
        features = try values.decodeIfPresent([String].self, forKey: .features)
        driver_id = try values.decodeIfPresent(String.self, forKey: .driver_id)
        vIP_Trip = try values.decodeIfPresent(VIP_Trip.self, forKey: .vIP_Trip)
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

    enum CodingKeys: String, CodingKey {

        case pickup_location_lat = "pickup_location_lat"
        case pickup_location_lng = "pickup_location_lng"
        case distination_location_lat = "distination_location_lat"
        case distination_location_lng = "distination_location_lng"
        case app_share_discount = "app_share_discount"
        case payment_status = "payment_status"
        case payment_method = "payment_method"
        case passnger_id = "passnger_id"
        case trip_id = "trip_id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pickup_location_lat = try values.decodeIfPresent(Double.self, forKey: .pickup_location_lat)
        pickup_location_lng = try values.decodeIfPresent(Double.self, forKey: .pickup_location_lng)
        distination_location_lat = try values.decodeIfPresent(Double.self, forKey: .distination_location_lat)
        distination_location_lng = try values.decodeIfPresent(Double.self, forKey: .distination_location_lng)
        app_share_discount = try values.decodeIfPresent(Int.self, forKey: .app_share_discount)
        payment_status = try values.decodeIfPresent(String.self, forKey: .payment_status)
        payment_method = try values.decodeIfPresent(String.self, forKey: .payment_method)
        passnger_id = try values.decodeIfPresent(Int.self, forKey: .passnger_id)
        trip_id = try values.decodeIfPresent(Int.self, forKey: .trip_id)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
    }

}
