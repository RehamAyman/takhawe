//
//  totalProfitModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 23/04/1446 AH.
//

import Foundation
struct totalProfitResult : Codable {
    let totalProfit : Double?
    let tripsReport : [TripsReport]?

    enum CodingKeys: String, CodingKey {

        case totalProfit = "totalProfit"
        case tripsReport = "tripsReport"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        totalProfit = try values.decodeIfPresent(Double.self, forKey: .totalProfit)
        tripsReport = try values.decodeIfPresent([TripsReport].self, forKey: .tripsReport)
    }

}


struct TripsReport : Codable {
    let tripid : Int?
    let avgrating : Int?
    let pickuplocation : String?
    let destinationlocation : String?
    let start_date : String?

    enum CodingKeys: String, CodingKey {

        case tripid = "tripid"
        case avgrating = "avgrating"
        case pickuplocation = "pickuplocation"
        case destinationlocation = "destinationlocation"
        case start_date = "start_date"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tripid = try values.decodeIfPresent(Int.self, forKey: .tripid)
        avgrating = try values.decodeIfPresent(Int.self, forKey: .avgrating)
        pickuplocation = try values.decodeIfPresent(String.self, forKey: .pickuplocation)
        destinationlocation = try values.decodeIfPresent(String.self, forKey: .destinationlocation)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
    }

}

