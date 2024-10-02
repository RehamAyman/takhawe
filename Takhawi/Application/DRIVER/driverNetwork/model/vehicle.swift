//
//  vehicle.swift
//  Takhawi
//
//  Created by Reham Ayman on 09/02/1446 AH.
//

import Foundation
struct VehicleResult : Codable {
    let id : Int?
    let serial_no : String?
    let plate_alphabet : String?
    let plate_number : String?
    let seats_no : Int?
    let production_year : Int?
    let driverId : Int?
    let vehicle_color_id : Int?
    let vehicle_class_id : Int?
    let vehicle_type_id : Int?
    let vehicle_name_id : Int?
    let createdAt : String?
    let updatedAt : String?
    let deletedAt : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case serial_no = "serial_no"
        case plate_alphabet = "plate_alphabet"
        case plate_number = "plate_number"
        case seats_no = "seats_no"
        case production_year = "production_year"
        case driverId = "driverId"
        case vehicle_color_id = "vehicle_color_id"
        case vehicle_class_id = "vehicle_class_id"
        case vehicle_type_id = "vehicle_type_id"
        case vehicle_name_id = "vehicle_name_id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case deletedAt = "deletedAt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        serial_no = try values.decodeIfPresent(String.self, forKey: .serial_no)
        plate_alphabet = try values.decodeIfPresent(String.self, forKey: .plate_alphabet)
        plate_number = try values.decodeIfPresent(String.self, forKey: .plate_number)
        seats_no = try values.decodeIfPresent(Int.self, forKey: .seats_no)
        production_year = try values.decodeIfPresent(Int.self, forKey: .production_year)
        driverId = try values.decodeIfPresent(Int.self, forKey: .driverId)
        vehicle_color_id = try values.decodeIfPresent(Int.self, forKey: .vehicle_color_id)
        vehicle_class_id = try values.decodeIfPresent(Int.self, forKey: .vehicle_class_id)
        vehicle_type_id = try values.decodeIfPresent(Int.self, forKey: .vehicle_type_id)
        vehicle_name_id = try values.decodeIfPresent(Int.self, forKey: .vehicle_name_id)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        deletedAt = try values.decodeIfPresent(String.self, forKey: .deletedAt)
    }

}
