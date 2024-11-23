//
//  notificationModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/05/1446 AH.
//


struct notificationResult : Codable {
    let id : Int?
    let type : String?
    let is_read : Bool?
    let createdAt : String?
    let updatedAt : String?
    let userId : Int?
    let title : String?
    let body : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case type = "type"
        case is_read = "is_read"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case userId = "userId"
        case title = "title"
        case body = "body"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        is_read = try values.decodeIfPresent(Bool.self, forKey: .is_read)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        body = try values.decodeIfPresent(String.self, forKey: .body)
    }

}

