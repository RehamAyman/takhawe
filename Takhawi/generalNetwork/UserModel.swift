////
////  UserModel.swift
////
////  Created by AAIT
////
//
//import Foundation
//




//
struct User : Codable {
    let id : Int?
    let uuid : String?
    let name : String?
    let phone : String?
    let email : String?
    let role : String?
    let avatar : String?
    let birth_date : String?
    let bio : String?
    let national_id : String?
    let gender : String?
    let location : String?
    let prefered_language : String?
    let is_verified : Bool?
    let is_blocked : Bool?
    let createdAt : String?
    let updatedAt : String?
    let deletedAt : String?
    let cityId : Int?
    var accountType: AccountType {
        switch role {
        case AccountType.user.rawValue:
            return .user
        case AccountType.delegate.rawValue:
            return .delegate
        default:
            return .unknown
        }
    }
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
        case location = "location"
        case prefered_language = "prefered_language"
        case is_verified = "is_verified"
        case is_blocked = "is_blocked"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case deletedAt = "deletedAt"
        case cityId = "cityId"
    }

    
}



