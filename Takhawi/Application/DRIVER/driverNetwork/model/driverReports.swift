//
//  driverReports.swift
//  Takhawi
//
//  Created by Reham Ayman on 22/04/1446 AH.
//

import Foundation
struct driverReportsResult : Codable {
    let totalRevenue : TotalRevenue?
    let monthlyRevenue : [MonthlyRevenue]?

    enum CodingKeys: String, CodingKey {

        case totalRevenue = "totalRevenue"
        case monthlyRevenue = "monthlyRevenue"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        totalRevenue = try values.decodeIfPresent(TotalRevenue.self, forKey: .totalRevenue)
        monthlyRevenue = try values.decodeIfPresent([MonthlyRevenue].self, forKey: .monthlyRevenue)
    }

}

struct TotalRevenue : Codable {
    let driver_profit : Double?
    let total_trips_price : Int?
    let total_distance : Int?
    let total_trips : Int?

    enum CodingKeys: String, CodingKey {

        case driver_profit = "driver_profit"
        case total_trips_price = "total_trips_price"
        case total_distance = "total_distance"
        case total_trips = "total_trips"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        driver_profit = try values.decodeIfPresent(Double.self, forKey: .driver_profit)
        total_trips_price = try values.decodeIfPresent(Int.self, forKey: .total_trips_price)
        total_distance = try values.decodeIfPresent(Int.self, forKey: .total_distance)
        total_trips = try values.decodeIfPresent(Int.self, forKey: .total_trips)
    }

}



struct MonthlyRevenue : Codable {
    let date : String?
    let total_trips_price : Int?
    let driver_profit : Double?
    let total_distance : Int?

    enum CodingKeys: String, CodingKey {

        case date = "date"
        case total_trips_price = "total_trips_price"
        case driver_profit = "driver_profit"
        case total_distance = "total_distance"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        total_trips_price = try values.decodeIfPresent(Int.self, forKey: .total_trips_price)
        driver_profit = try values.decodeIfPresent(Double.self, forKey: .driver_profit)
        total_distance = try values.decodeIfPresent(Int.self, forKey: .total_distance)
    }

}




