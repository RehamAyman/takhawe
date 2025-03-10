////
////  UserModel.swift
////
////  Created by AAIT
////

//
struct User : Codable {
    let id : Int?
    let uuid : String?
    let name : String?
    let phone : String?
    let email : String?
    var role : String?
    let avatar : String?
    let birth_date : String?
    let bio : String?
    let national_id : String?
    let gender : String?
    let prefered_language : String?
    let is_verified : Bool?
    let is_blocked : Bool?
    let createdAt : String?
    let updatedAt : String?
    let deletedAt : String?
    let cityId : Int?
    let driver_status : String?
    let passenger_status : String?
  
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case uuid = "uuid"
        case name = "name"
        case phone = "phone"
        case email = "email"
        case role = "role"
        case avatar = "avatar"
        case birth_date = "birth_date"
        case bio = "bio"
        case national_id = "national_id"
        case gender = "gender"
        case prefered_language = "prefered_language"
        case is_verified = "phone_verified"
        case is_blocked = "is_blocked"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case deletedAt = "deletedAt"
        case cityId = "cityId"
        case driver_status = "driver_status"
        case passenger_status = "passenger_status"
        
    }

    
}



