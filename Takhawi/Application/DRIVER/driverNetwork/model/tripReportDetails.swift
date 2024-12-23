//
//  tripReportDetails.swift
//  Takhawi
//
//  Created by Reham Ayman on 23/04/1446 AH.
//

import Foundation
struct tripReportDetailsResult : Codable {
    let id : Int?
    let start_date : String?
    let end_date : String?
    let price : Int?
    let pickup_location : Pickuplocation1?
    let Destination : Pickuplocation1?
    let passengers : [reportPassengers]?
    let net_profit : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case start_date = "start_date"
        case end_date = "end_date"
        case price = "price"
        case pickup_location = "pickup_location"
        case Destination = "destination"
        case passengers = "passengers"
        case net_profit = "net_profit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        pickup_location = try values.decodeIfPresent(Pickuplocation1.self, forKey: .pickup_location)
        Destination = try values.decodeIfPresent(Pickuplocation1.self, forKey: .Destination)
        passengers = try values.decodeIfPresent([reportPassengers].self, forKey: .passengers)
        net_profit = try values.decodeIfPresent(Int.self, forKey: .net_profit)
    }

}

struct reportPassengers : Codable {
    let name : String?
    let avatar : String?
    let passenger_rate : Int?
    let payment_method : String?
    let cost : Int?
    let discount : Int?
    let compensation : Int?
    let net_profit : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case avatar = "avatar"
        case passenger_rate = "passenger_rate"
        case payment_method = "payment_method"
        case cost = "cost"
        case discount = "discount"
        case compensation = "compensation"
        case net_profit = "net_profit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        passenger_rate = try values.decodeIfPresent(Int.self, forKey: .passenger_rate)
        payment_method = try values.decodeIfPresent(String.self, forKey: .payment_method)
        cost = try values.decodeIfPresent(Int.self, forKey: .cost)
        discount = try values.decodeIfPresent(Int.self, forKey: .discount)
        compensation = try values.decodeIfPresent(Int.self, forKey: .compensation)
        net_profit = try values.decodeIfPresent(String.self, forKey: .net_profit)
    }

}

struct reportDestination : Codable {
    let lat : Double?
    let lng : Double?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }

}
