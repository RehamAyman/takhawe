//
//  openChatModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 30/03/1446 AH.
//

import Foundation


struct openChatResult : Codable {
    let id : String?
    let userId : Int?
    let driverId : Int?
    let tripId : Int?
    let is_active : Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case userId = "userId"
        case driverId = "driverId"
        case tripId = "tripId"
        case is_active = "is_active"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        driverId = try values.decodeIfPresent(Int.self, forKey: .driverId)
        tripId = try values.decodeIfPresent(Int.self, forKey: .tripId)
        is_active = try values.decodeIfPresent(Bool.self, forKey: .is_active)
    }

}
