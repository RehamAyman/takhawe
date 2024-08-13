//
//  driverStatus.swift
//  Takhawi
//
//  Created by Reham Ayman on 22/07/2024.
//


import Foundation


struct DriverStatusResult : Codable {
    let vehicle_Images : Bool?
    let vehicle_Licence : Bool?
    let insurance_Image : Bool?
    let national_Id_Images : Bool?
    let driving_Licence_Images : Bool?
    let avatar_Image : Bool?
    let vehicle_Exist : Bool?

    enum CodingKeys: String, CodingKey {

        case vehicle_Images = "Vehicle_Images"
        case vehicle_Licence = "Vehicle_Licence"
        case insurance_Image = "Insurance_Image"
        case national_Id_Images = "National_Id_Images"
        case driving_Licence_Images = "Driving_Licence_Images"
        case avatar_Image = "Avatar_Image"
        case vehicle_Exist = "Vehicle_Exist"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vehicle_Images = try values.decodeIfPresent(Bool.self, forKey: .vehicle_Images)
        vehicle_Licence = try values.decodeIfPresent(Bool.self, forKey: .vehicle_Licence)
        insurance_Image = try values.decodeIfPresent(Bool.self, forKey: .insurance_Image)
        national_Id_Images = try values.decodeIfPresent(Bool.self, forKey: .national_Id_Images)
        driving_Licence_Images = try values.decodeIfPresent(Bool.self, forKey: .driving_Licence_Images)
        avatar_Image = try values.decodeIfPresent(Bool.self, forKey: .avatar_Image)
        vehicle_Exist = try values.decodeIfPresent(Bool.self, forKey: .vehicle_Exist)
    }

}
