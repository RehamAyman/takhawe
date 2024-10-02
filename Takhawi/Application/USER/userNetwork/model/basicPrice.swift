//
//  basicPrice.swift
//  Takhawi
//
//  Created by Reham Ayman on 18/02/1446 AH.
//

import Foundation


struct BasicPriceResult : Codable {
    let price : Int?
    let app_share : Int?
    let debt : Int?
    let discount : Int?
    let total_price : Int?

    enum CodingKeys: String, CodingKey {

        case price = "price"
        case app_share = "app_share"
        case debt = "debt"
        case discount = "discount"
        case total_price = "total_price"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        app_share = try values.decodeIfPresent(Int.self, forKey: .app_share)
        debt = try values.decodeIfPresent(Int.self, forKey: .debt)
        discount = try values.decodeIfPresent(Int.self, forKey: .discount)
        total_price = try values.decodeIfPresent(Int.self, forKey: .total_price)
    }

}
