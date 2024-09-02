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
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        birth_date = try values.decodeIfPresent(String.self, forKey: .birth_date)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
        prefered_language = try values.decodeIfPresent(String.self, forKey: .prefered_language)
        city = try values.decodeIfPresent(cityDataModel.self, forKey: .city)
        hobbies = try values.decodeIfPresent([HobbiesClass].self, forKey: .hobbies)
    }

}


struct cityDataModel  : Codable {
    let id : Int?
    let ar_name : String?
    let en_name : String?
    
    
    
}
