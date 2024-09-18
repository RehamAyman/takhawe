//
//  favDriverModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/03/1446 AH.
//

import Foundation
struct FavDriverResult : Codable {
    let id : Int?
    let name : String?
    let avatar : String?
    let rating : Int?
    let reviews : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case avatar = "avatar"
        case rating = "rating"
        case reviews = "reviews"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        reviews = try values.decodeIfPresent(Int.self, forKey: .reviews)
    }

}
