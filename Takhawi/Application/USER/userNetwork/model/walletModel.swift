//
//  walletModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/02/1446 AH.
//

import Foundation

struct WalletTransactions : Codable {
    let id : Int?
    let transaction_type : String?
    let current_balance : Int?
    let previous_balance : Int?
    let amount : Int?
    let createdAt : String?
    let updatedAt : String?
    let deletedAt : String?
    let trip_id : Int?
    let passenger_id : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case transaction_type = "transaction_type"
        case current_balance = "current_balance"
        case previous_balance = "previous_balance"
        case amount = "amount"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case deletedAt = "deletedAt"
        case trip_id = "trip_id"
        case passenger_id = "passenger_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        transaction_type = try values.decodeIfPresent(String.self, forKey: .transaction_type)
        current_balance = try values.decodeIfPresent(Int.self, forKey: .current_balance)
        previous_balance = try values.decodeIfPresent(Int.self, forKey: .previous_balance)
        amount = try values.decodeIfPresent(Int.self, forKey: .amount)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        deletedAt = try values.decodeIfPresent(String.self, forKey: .deletedAt)
        trip_id = try values.decodeIfPresent(Int.self, forKey: .trip_id)
        passenger_id = try values.decodeIfPresent(Int.self, forKey: .passenger_id)
    }
    
    
    
    

}




struct WalletResult : Codable {
    let balance : Int?
    let transactions : [WalletTransactions]?

    enum CodingKeys: String, CodingKey {

        case balance = "balance"
        case transactions = "transactions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        balance = try values.decodeIfPresent(Int.self, forKey: .balance)
        transactions = try values.decodeIfPresent([WalletTransactions].self, forKey: .transactions)
    }

}

