//
//  recentAddressModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 07/08/2024.
//

import Foundation


struct RecentAddressResult : Codable {
    let id : Int?
    let lat : Double?
    let lng : Double?
    let alias : String?
    let description : String?
    let createdAt : String?
    let updatedAt : String?
    let userId : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case lat = "lat"
        case lng = "lng"
        case alias = "alias"
        case description = "description"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case userId = "userId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        alias = try values.decodeIfPresent(String.self, forKey: .alias)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
    }

}
