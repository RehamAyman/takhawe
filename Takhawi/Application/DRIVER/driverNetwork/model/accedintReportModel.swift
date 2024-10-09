//
//  accedintReportModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 06/04/1446 AH.
//

import Foundation
struct AccedintReportsResult : Codable {
    let id : Int?
    let location : AccLocation?
    let distance : Double?
    let type : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case location = "location"
        case distance = "distance"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        location = try values.decodeIfPresent(AccLocation.self, forKey: .location)
        distance = try values.decodeIfPresent(Double.self, forKey: .distance)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
struct AccLocation : Codable {
    let lat : Double?
    let lng : Double?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
    }

}
