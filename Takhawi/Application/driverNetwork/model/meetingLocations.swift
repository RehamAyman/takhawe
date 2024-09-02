//
//  meetingLocations.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/02/1446 AH.
//

import Foundation


struct meetingLocationResult : Codable {
    let id : Int?
    let location : meetingLocation?
    let cityId : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case location = "location"
        case cityId = "cityId"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        location = try values.decodeIfPresent(meetingLocation.self, forKey: .location)
        cityId = try values.decodeIfPresent(Int.self, forKey: .cityId)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}


struct meetingLocation : Codable {
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
