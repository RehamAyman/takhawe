//
//  APIGloabelResponse.swift
//
//  Created by AAIT
//

import Foundation

class APIGloabelResponse: Codable {
    var key: APIServerResponseKey
    var message: String
//    var code: Int?
    var userStatus: String?
    enum CodingKeys: String, CodingKey {
        case key
//        case code
        case message = "msg"
        case userStatus = "user_status"

    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decode(APIServerResponseKey.self, forKey: .key)
        message = try values.decode(String.self, forKey: .message)
//        code = try values.decode(Int.self, forKey: .code)
//        userStatus = try values.decodeIfPresent(String.self, forKey: .userStatus)

    }

}

class APIGenericResponse<T: Codable>: APIGloabelResponse {

    var data: T?

    enum CodingKeys: String, CodingKey {
        case data
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(T.self, forKey: .data)
    }

}

// MARK: - Pagination
struct Pagination: Codable {
    let totalItems, countItems, perPage, totalPages: Int
    let currentPage: Int
    let nextPageURL: String
    let pervPageURL: String

    enum CodingKeys: String, CodingKey {
        case totalItems = "total_items"
        case countItems = "count_items"
        case perPage = "per_page"
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextPageURL = "next_page_url"
        case pervPageURL = "perv_page_url"
    }
}
