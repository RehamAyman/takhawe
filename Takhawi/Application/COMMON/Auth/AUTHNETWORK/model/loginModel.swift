//
//  loginModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/05/2024.
//

import Foundation


struct LoginModelData : Codable {
    var user : User?
    let accessToken : String?
    let refreshToken : String?

    enum CodingKeys: String, CodingKey {

        case user = "user"
        case accessToken = "accessToken"
        case refreshToken = "refreshToken"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
        refreshToken = try values.decodeIfPresent(String.self, forKey: .refreshToken)
    }

}


struct  SwitchRoleResult : Codable {
    let accessToken : String?
    let refreshToken : String?
    let id : Int?
    let avatar : String?
    let name : String?
    let email : String?
    let phone : String?
    let birth_date : String?
    let gender : String?
    let bio : String?
    let prefered_language : String?
    let profile_complted : Int?
    let role : String?
    let driver_status : String?
    let passenger_status : String?
   // let hobbies : [String]?
    let rate : Int?
    let vehicles : String?
    let activeTrip : String?

    enum CodingKeys: String, CodingKey {

        case accessToken = "accessToken"
        case refreshToken = "refreshToken"
        case id = "id"
        case avatar = "avatar"
        case name = "name"
        case email = "email"
        case phone = "phone"
        case birth_date = "birth_date"
        case gender = "gender"
        case bio = "bio"
        case prefered_language = "prefered_language"
        case profile_complted = "profile_complted"
        case role = "role"
        case driver_status = "driver_status"
        case passenger_status = "passenger_status"
      //  case hobbies = "Hobbies"
        case rate = "rate"
        case vehicles = "Vehicles"
        case activeTrip = "activeTrip"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
        refreshToken = try values.decodeIfPresent(String.self, forKey: .refreshToken)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        birth_date = try values.decodeIfPresent(String.self, forKey: .birth_date)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
        prefered_language = try values.decodeIfPresent(String.self, forKey: .prefered_language)
        profile_complted = try values.decodeIfPresent(Int.self, forKey: .profile_complted)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        driver_status = try values.decodeIfPresent(String.self, forKey: .driver_status)
        passenger_status = try values.decodeIfPresent(String.self, forKey: .passenger_status)
      //  hobbies = try values.decodeIfPresent([String].self, forKey: .hobbies)
        rate = try values.decodeIfPresent(Int.self, forKey: .rate)
        vehicles = try values.decodeIfPresent(String.self, forKey: .vehicles)
        activeTrip = try values.decodeIfPresent(String.self, forKey: .activeTrip)
    }

}
