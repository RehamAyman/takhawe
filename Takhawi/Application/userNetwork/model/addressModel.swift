//
//  addressModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/03/1446 AH.
//

import Foundation
struct AddressResult : Codable {
    let id : Int?
    let lat : Double?
    let lng : Double?
    let alias : String?
    let description : String?
    let is_favorite : Bool?
    let createdAt : String?
    let updatedAt : String?
    let deletedAt : String?
    let userId : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case lat = "lat"
        case lng = "lng"
        case alias = "alias"
        case description = "description"
        case is_favorite = "is_favorite"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case deletedAt = "deletedAt"
        case userId = "userId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        alias = try values.decodeIfPresent(String.self, forKey: .alias)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        is_favorite = try values.decodeIfPresent(Bool.self, forKey: .is_favorite)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        deletedAt = try values.decodeIfPresent(String.self, forKey: .deletedAt)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
    }

}
