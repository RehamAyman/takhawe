//
//  chatDataModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/04/1446 AH.
//

import Foundation


struct ChatDataModelResult  : Codable {
    let id : String?
    let userId : Int?
    let driverId : Int?
    let tripId : Int?
    let is_active : Bool?
    let user : ChatUser?
    let unread_messages : Int?
    let last_message : Last_message?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case userId = "userId"
        case driverId = "driverId"
        case tripId = "tripId"
        case is_active = "is_active"
        case user = "User"
        case unread_messages = "unread_messages"
        case last_message = "last_message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        driverId = try values.decodeIfPresent(Int.self, forKey: .driverId)
        tripId = try values.decodeIfPresent(Int.self, forKey: .tripId)
        is_active = try values.decodeIfPresent(Bool.self, forKey: .is_active)
        user = try values.decodeIfPresent(ChatUser.self, forKey: .user)
        unread_messages = try values.decodeIfPresent(Int.self, forKey: .unread_messages)
        last_message = try values.decodeIfPresent(Last_message.self, forKey: .last_message)
    }

}



struct ChatUser : Codable {
    let id : Int?
    let name : String?
    let avatar : String?
    let phone : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case avatar = "avatar"
        case phone = "phone"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
    }

}



struct Last_message : Codable {
    let id : String?
    let content : String?
    let contentType : String?
    let createdAt : String?
    let chatId : String?
    let is_read : Bool?
    let senderId : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case content = "content"
        case contentType = "contentType"
        case createdAt = "createdAt"
        case chatId = "chatId"
        case is_read = "is_read"
        case senderId = "senderId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        content = try values.decodeIfPresent(String.self, forKey: .content)
        contentType = try values.decodeIfPresent(String.self, forKey: .contentType)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        chatId = try values.decodeIfPresent(String.self, forKey: .chatId)
        is_read = try values.decodeIfPresent(Bool.self, forKey: .is_read)
        senderId = try values.decodeIfPresent(Int.self, forKey: .senderId)
    }

}
