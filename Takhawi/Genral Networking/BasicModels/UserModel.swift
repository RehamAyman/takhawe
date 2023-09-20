//
//  UserModel.swift
//
//  Created by AAIT
//

import Foundation

struct UserModel: Codable {
    let key: String?
    let msg: String?
    let user: User
}

struct User: Codable, CodableInit {
    var id: Int?
    var name, email, countryKey: String?
    var completedInfo: Bool?
    var phone, changedPhone: String?
    var image: String?
    var country, nationalityName, country_name: String?
    var lat, long, address: String?
    var wallet, totalDeliveryFees, numOrders: String?
    var numComments, accType, timeZone, date: String?
    var newOrderNotify, offerNotify: Bool?
    var nationalityId, cityId: Int?
    var description, cardholderName: String?
    var rate: Int?
    var age: Int?
    var country_id: Int?
    var bankAccountNumber, bankIbanNumber, bankName, ownerBankName, country_code, avg_rate: String?
    var token: String?

    var accountType: AccountType {
        switch accType {
        case AccountType.user.rawValue:
            return .user
        case AccountType.delegate.rawValue:
            return .delegate
        default:
            return .unknown
        }
    }

    enum CodingKeys: String, CodingKey {
        case rate = "rate_count"
        case id, name, email, phone, image, description, age, country_id, token, country_code, avg_rate
        case completedInfo = "completed_info"
        case cardholderName = "cardholder_name"
        case countryKey = "country_key"
        case lat, long, address, wallet, country_name
        case totalDeliveryFees = "total_delivery_fees"
        case numOrders = "num_orders"
        case numComments = "num_comments"
        case accType = "acc_type"
        case timeZone = "time_zone"
        case date, country
        case cityId = "city_id"
//        case city = "city_name"
        case nationalityId = "nationality_id"
        case nationalityName = "nationality_name"
        case changedPhone = "changed_phone"
        case newOrderNotify = "new_orders_notify"
        case offerNotify = "offers_notify"
        case bankAccountNumber = "bank_account_number"
        case bankIbanNumber = "bank_iban_number"
        case bankName = "bank_name"
        case ownerBankName = "owner_bank_name"
    }
}
