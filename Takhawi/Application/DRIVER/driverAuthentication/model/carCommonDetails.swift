//
//  carCommonDetails.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/08/2024.
//

import Foundation
struct CarDetailsResult : Codable {
    let vehicleColor : [VehicleColor]?
    let vehicleClass : [VehicleClass]?
    let vehicleTypes : [VehicleTypes]?
    let vehicleName : [VehicleName]?
    let start_year : Int?

    enum CodingKeys: String, CodingKey {

        case vehicleColor = "vehicleColor"
        case vehicleClass = "vehicleClass"
        case vehicleTypes = "vehicleTypes"
        case vehicleName = "vehicleName"
        case start_year = "start_year"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vehicleColor = try values.decodeIfPresent([VehicleColor].self, forKey: .vehicleColor)
        vehicleClass = try values.decodeIfPresent([VehicleClass].self, forKey: .vehicleClass)
        vehicleTypes = try values.decodeIfPresent([VehicleTypes].self, forKey: .vehicleTypes)
        vehicleName = try values.decodeIfPresent([VehicleName].self, forKey: .vehicleName)
        start_year =  try values.decodeIfPresent(Int.self, forKey: .start_year) 
    }

}

struct VehicleClass : Codable  , Identifiable   {
    let id : Int?
    let name : String?
    let createdAt : String?
    let updatedAt : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
    }

}


struct VehicleColor : Codable {
    let id : Int?
    let name : String?
    let createdAt : String?
    let updatedAt : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
    }

}

struct VehicleName : Codable {
    let id : Int?
    let name : String?
    
    let createdAt : String?
    let updatedAt : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
       
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
      
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
    }

}
struct VehicleTypes : Codable {
    let id : Int?
    let name : String?
    let createdAt : String?
    let updatedAt : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
    }

}

struct HobbiesClass : Codable  , Identifiable   {
    let id : Int?
    let name : String?
   

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
     
    }

 

}
