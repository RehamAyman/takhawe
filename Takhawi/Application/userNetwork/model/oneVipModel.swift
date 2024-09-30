//
//  oneVipModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/03/1446 AH.
//

import Foundation


struct OneVipTripResult : Codable {
    let trips : Int?
    let pickup_location_lat : Double?
    let pickup_location_lng : Double?
    let pickup_description : String?
    let destination_location_lat : Double?
    let destination_location_lng : Double?
    let destination_description : String?
    let discount : Int?
    let app_share_discount : Int?
    let user_app_share : Int?
    let user_debt : Int?
    let payment_status : String?
    let payment_method : String?
    let promoCodeId : String?
    let passnger_id : Int?
    let trip_id : Int?
    let createdAt : String?
    let updatedAt : String?
    let trip : oneVipTrip?
    let passnger : oneVipPassnger?

    enum CodingKeys: String, CodingKey {

        case trips = "trips"
        case pickup_location_lat = "pickup_location_lat"
        case pickup_location_lng = "pickup_location_lng"
        case pickup_description = "pickup_description"
        case destination_location_lat = "destination_location_lat"
        case destination_location_lng = "destination_location_lng"
        case destination_description = "destination_description"
        case discount = "discount"
        case app_share_discount = "app_share_discount"
        case user_app_share = "user_app_share"
        case user_debt = "user_debt"
        case payment_status = "payment_status"
        case payment_method = "payment_method"
        case promoCodeId = "promoCodeId"
        case passnger_id = "passnger_id"
        case trip_id = "trip_id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case trip = "Trip"
        case passnger = "Passnger"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        trips = try values.decodeIfPresent(Int.self, forKey: .trips)
        pickup_location_lat = try values.decodeIfPresent(Double.self, forKey: .pickup_location_lat)
        pickup_location_lng = try values.decodeIfPresent(Double.self, forKey: .pickup_location_lng)
        pickup_description = try values.decodeIfPresent(String.self, forKey: .pickup_description)
        destination_location_lat = try values.decodeIfPresent(Double.self, forKey: .destination_location_lat)
        destination_location_lng = try values.decodeIfPresent(Double.self, forKey: .destination_location_lng)
        destination_description = try values.decodeIfPresent(String.self, forKey: .destination_description)
        discount = try values.decodeIfPresent(Int.self, forKey: .discount)
        app_share_discount = try values.decodeIfPresent(Int.self, forKey: .app_share_discount)
        user_app_share = try values.decodeIfPresent(Int.self, forKey: .user_app_share)
        user_debt = try values.decodeIfPresent(Int.self, forKey: .user_debt)
        payment_status = try values.decodeIfPresent(String.self, forKey: .payment_status)
        payment_method = try values.decodeIfPresent(String.self, forKey: .payment_method)
        promoCodeId = try values.decodeIfPresent(String.self, forKey: .promoCodeId)
        passnger_id = try values.decodeIfPresent(Int.self, forKey: .passnger_id)
        trip_id = try values.decodeIfPresent(Int.self, forKey: .trip_id)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        trip = try values.decodeIfPresent(oneVipTrip.self, forKey: .trip)
        passnger = try values.decodeIfPresent(oneVipPassnger.self, forKey: .passnger)
    }

}


struct oneVipTrip : Codable {
    let id : Int?
    let start_date : String?
    let end_date : String?
    let status : String?
    let price : Int?
    let discount : Int?
    let driver_app_share : Int?
    let user_app_share : Int?
    let user_debt : Int?
    let user_tax : Int?
    let driver_tax : Int?
    let gender : String?
    let type : String?
    let createdAt : String?
    let updatedAt : String?
    let deletedAt : String?
    let features : [String]?
    let driver_id : String?
    let vehicle_id : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case start_date = "start_date"
        case end_date = "end_date"
        case status = "status"
        case price = "price"
        case discount = "discount"
        case driver_app_share = "driver_app_share"
        case user_app_share = "user_app_share"
        case user_debt = "user_debt"
        case user_tax = "user_tax"
        case driver_tax = "driver_tax"
        case gender = "gender"
        case type = "type"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case deletedAt = "deletedAt"
        case features = "features"
        case driver_id = "driver_id"
        case vehicle_id = "vehicle_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        discount = try values.decodeIfPresent(Int.self, forKey: .discount)
        driver_app_share = try values.decodeIfPresent(Int.self, forKey: .driver_app_share)
        user_app_share = try values.decodeIfPresent(Int.self, forKey: .user_app_share)
        user_debt = try values.decodeIfPresent(Int.self, forKey: .user_debt)
        user_tax = try values.decodeIfPresent(Int.self, forKey: .user_tax)
        driver_tax = try values.decodeIfPresent(Int.self, forKey: .driver_tax)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        deletedAt = try values.decodeIfPresent(String.self, forKey: .deletedAt)
        features = try values.decodeIfPresent([String].self, forKey: .features)
        driver_id = try values.decodeIfPresent(String.self, forKey: .driver_id)
        vehicle_id = try values.decodeIfPresent(String.self, forKey: .vehicle_id)
    }

}
struct oneVipPassnger : Codable {
    let id : Int?
    let name : String?
    let avatar : String?
    let passenger_rate : Int?
    let hobbies : [String]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case avatar = "avatar"
        case passenger_rate = "passenger_rate"
        case hobbies = "Hobbies"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        passenger_rate = try values.decodeIfPresent(Int.self, forKey: .passenger_rate)
        hobbies = try values.decodeIfPresent([String].self, forKey: .hobbies)
    }

}
