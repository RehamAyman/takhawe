//
//  profileData.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/02/1446 AH.
//

import Foundation


struct profileResult : Codable {
    let id : Int?
    let avatar : String?
    let name : String?
    let email : String?
    let phone : String?
    let birth_date : String?
    let gender : String?
    let bio : String?
    let prefered_language : String?
    let city : cityDataModel?
    let hobbies : [HobbiesClass]?
    let profile_complted : Int?
    let Vehicles : Vehicles?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case avatar = "avatar"
        case name = "name"
        case email = "email"
        case phone = "phone"
        case birth_date = "birth_date"
        case gender = "gender"
        case bio = "bio"
        case prefered_language = "prefered_language"
        case city = "City"
        case hobbies = "Hobbies"
        case profile_complted = "profile_complted"
        case Vehicles = "Vehicles"
    }

   

}


struct cityDataModel  : Codable {
    let id : Int?
    let name : String?
   
    
    
    
}
