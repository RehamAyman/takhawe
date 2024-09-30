//
//  generaltripModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/03/1446 AH.
//

import Foundation
struct GeneralTripResult : Codable {
    let id : Int?
    let start_date : String?
    let status : String?
    let type : String?
    let driver : GDriver?
    let vehicle : Vehicle?
    let pickup_location : Pickup_location?
    let destinationL : Pickup_location?
    let passengerTripId : Int?
    let price : Int?
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case start_date = "start_date"
        case status = "status"
        case type = "type"
        case driver = "Driver"
        case vehicle = "Vehicle"
        case pickup_location = "pickup_location"
        case destinationL = "destination"
        case passengerTripId = "passengerTripId"
        case price = "price"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        driver = try values.decodeIfPresent(GDriver.self, forKey: .driver)
        vehicle = try values.decodeIfPresent(Vehicle.self, forKey: .vehicle)
        pickup_location = try values.decodeIfPresent(Pickup_location.self, forKey: .pickup_location)
        destinationL = try values.decodeIfPresent(Pickup_location.self, forKey: .destinationL)
        passengerTripId = try values.decodeIfPresent(Int.self, forKey: .passengerTripId)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
    }

}


struct Vehicle : Codable {
    let id : Int?
    let plate_alphabet : String?
    let plate_number : String?
    let vehicle_Type : itemObj?
    let vehicle_Class : itemObj?
    let vehicle_Color : itemObj?
    let vehicle_Name : itemObj?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case plate_alphabet = "plate_alphabet"
        case plate_number = "plate_number"
        case vehicle_Type = "Vehicle_Type"
        case vehicle_Class = "Vehicle_Class"
        case vehicle_Color = "Vehicle_Color"
        case vehicle_Name = "Vehicle_Name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        plate_alphabet = try values.decodeIfPresent(String.self, forKey: .plate_alphabet)
        plate_number = try values.decodeIfPresent(String.self, forKey: .plate_number)
        vehicle_Type = try values.decodeIfPresent(itemObj.self, forKey: .vehicle_Type)
        vehicle_Class = try values.decodeIfPresent(itemObj.self, forKey: .vehicle_Class)
        vehicle_Color = try values.decodeIfPresent(itemObj.self, forKey: .vehicle_Color)
        vehicle_Name = try values.decodeIfPresent(itemObj.self, forKey: .vehicle_Name)
    }

}
