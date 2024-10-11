//
//  savedCard.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/04/1446 AH.
//

import Foundation

struct cardResult : Codable {
    let id : Int?
    let user_id : Int?
    let card_number : String?
    let card_holder : String?
    let card_exp_month : String?
    let card_exp_year : String?
    let payment_brand : String?
    let createdAt : String?
    let updatedAt : String?
    let deletedAt : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case card_number = "card_number"
        case card_holder = "card_holder"
        case card_exp_month = "card_exp_month"
        case card_exp_year = "card_exp_year"
        case payment_brand = "payment_brand"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case deletedAt = "deletedAt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        card_number = try values.decodeIfPresent(String.self, forKey: .card_number)
        card_holder = try values.decodeIfPresent(String.self, forKey: .card_holder)
        card_exp_month = try values.decodeIfPresent(String.self, forKey: .card_exp_month)
        card_exp_year = try values.decodeIfPresent(String.self, forKey: .card_exp_year)
        payment_brand = try values.decodeIfPresent(String.self, forKey: .payment_brand)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        deletedAt = try values.decodeIfPresent(String.self, forKey: .deletedAt)
    }

}
