//
//  oneBasicTrip.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/02/1446 AH.
//

import Foundation

struct AdditionalOneBasicResult : Codable {
    let id : Int?
    let start_date : String?
    let end_date : String?
    let driver_id : Int?
    let createdAt : String?
    let updatedAt : String?
    let status : String?
    let features : [String]?
    let driver : AdditionalDriver?
    let basic_Trip : Basic_Trip?
    let completed_trips_count : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case start_date = "start_date"
        case end_date = "end_date"
        case driver_id = "driver_id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case status = "status"
        case features = "features"
        case driver = "Driver"
        case basic_Trip = "Basic_Trip"
        case completed_trips_count = "completed_trips_count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        driver_id = try values.decodeIfPresent(Int.self, forKey: .driver_id)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        features = try values.decodeIfPresent([String].self, forKey: .features)
        driver = try values.decodeIfPresent(AdditionalDriver.self, forKey: .driver)
        basic_Trip = try values.decodeIfPresent(Basic_Trip.self, forKey: .basic_Trip)
        completed_trips_count = try values.decodeIfPresent(Int.self, forKey: .completed_trips_count)
    }

}

struct OneBasicResult : Codable {
    let id : Int?
    let start_date : String?
    let end_date : String?
    let driver_id : Int?
    let createdAt : String?
    let updatedAt : String?
    let status : String?
    let features : [String]?
    let driver : Driver?
    let basic_Trip : Basic_Trip?
    let completed_trips_count : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case start_date = "start_date"
        case end_date = "end_date"
        case driver_id = "driver_id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case status = "status"
        case features = "features"
        case driver = "Driver"
        case basic_Trip = "Basic_Trip"
        case completed_trips_count = "completed_trips_count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        driver_id = try values.decodeIfPresent(Int.self, forKey: .driver_id)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        features = try values.decodeIfPresent([String].self, forKey: .features)
        driver = try values.decodeIfPresent(Driver.self, forKey: .driver)
        basic_Trip = try values.decodeIfPresent(Basic_Trip.self, forKey: .basic_Trip)
        completed_trips_count = try values.decodeIfPresent(Int.self, forKey: .completed_trips_count)
    }

}
struct Basic_Trip : Codable {
    let seats_no : Int?
    let available_seats_no : Int?
    let price_per_seat : Int?
    let destination_id : Int?
    let pickup_location_id : Int?

    enum CodingKeys: String, CodingKey {

        case seats_no = "seats_no"
        case available_seats_no = "available_seats_no"
        case price_per_seat = "price_per_seat"
        case destination_id = "destination_id"
        case pickup_location_id = "pickup_location_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        seats_no = try values.decodeIfPresent(Int.self, forKey: .seats_no)
        available_seats_no = try values.decodeIfPresent(Int.self, forKey: .available_seats_no)
        price_per_seat = try values.decodeIfPresent(Int.self, forKey: .price_per_seat)
        destination_id = try values.decodeIfPresent(Int.self, forKey: .destination_id)
        pickup_location_id = try values.decodeIfPresent(Int.self, forKey: .pickup_location_id)
    }

}
