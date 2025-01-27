//
//  revirewsList.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/07/1446 AH.
//


import Foundation



struct ReviewsListResult : Codable {
    let id : Int?
    let rate : Double?
    let note : String?
    let type : String?
    let createdAt : String?
    let updatedAt : String?
    let deletedAt : String?
    let reviewer_id : Int?
    let target_id : Int?
    let trip_id : Int?
    let Reviewers : Reviewers?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case rate = "rate"
        case note = "note"
        case type = "type"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case deletedAt = "deletedAt"
        case reviewer_id = "reviewer_id"
        case target_id = "target_id"
        case trip_id = "trip_id"
        case Reviewers = "Reviewers"
    }



}





struct Reviewers : Codable  {
    let  avatar : String?
    let name : String?
}
