//
//  basicTripListModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 06/08/2024.
//

import Foundation

struct BasicTripResult : Codable {
    let id : Int?
    let start_date : String?
    let end_date : String?
    let driver_id : Int?
    let status : String?
    let features : [String]?
    let driver_name : String?
    let driver_phone : String?
    let driver_location : Driver_location?
    let driver_avatar : String?
    let basic_trip_seats_no : Int?
    let basic_trip_available_seats_no : Int?
    let basic_trip_price_per_seat : Int?
    let basic_trip_destination_id : Int?
    let basic_trip_pickup_location_id : Int?
    let distance : Double?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case start_date = "start_date"
        case end_date = "end_date"
        case driver_id = "driver_id"
        case status = "status"
        case features = "features"
        case driver_name = "driver_name"
        case driver_phone = "driver_phone"
        case driver_location = "driver_location"
        case driver_avatar = "driver_avatar"
        case basic_trip_seats_no = "basic_trip_seats_no"
        case basic_trip_available_seats_no = "basic_trip_available_seats_no"
        case basic_trip_price_per_seat = "basic_trip_price_per_seat"
        case basic_trip_destination_id = "basic_trip_destination_id"
        case basic_trip_pickup_location_id = "basic_trip_pickup_location_id"
        case distance = "distance"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        driver_id = try values.decodeIfPresent(Int.self, forKey: .driver_id)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        features = try values.decodeIfPresent([String].self, forKey: .features)
        driver_name = try values.decodeIfPresent(String.self, forKey: .driver_name)
        driver_phone = try values.decodeIfPresent(String.self, forKey: .driver_phone)
        driver_location = try values.decodeIfPresent(Driver_location.self, forKey: .driver_location)
        driver_avatar = try values.decodeIfPresent(String.self, forKey: .driver_avatar)
        basic_trip_seats_no = try values.decodeIfPresent(Int.self, forKey: .basic_trip_seats_no)
        basic_trip_available_seats_no = try values.decodeIfPresent(Int.self, forKey: .basic_trip_available_seats_no)
        basic_trip_price_per_seat = try values.decodeIfPresent(Int.self, forKey: .basic_trip_price_per_seat)
        basic_trip_destination_id = try values.decodeIfPresent(Int.self, forKey: .basic_trip_destination_id)
        basic_trip_pickup_location_id = try values.decodeIfPresent(Int.self, forKey: .basic_trip_pickup_location_id)
        distance = try values.decodeIfPresent(Double.self, forKey: .distance)
    }

}

struct Driver_location : Codable {
    let lat : Double?
    let lng : Double?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
    }

}
