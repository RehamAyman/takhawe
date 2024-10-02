//
//  cities.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/08/2024.
//

import Foundation

struct CitiesResult : Codable {
    let id : Int?
    let name : String?
    let createdAt : String?
    let updatedAt : String?
    let deletedAt : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
       
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case deletedAt = "deletedAt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        deletedAt = try values.decodeIfPresent(String.self, forKey: .deletedAt)
    }

}
