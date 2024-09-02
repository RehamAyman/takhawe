//
//  Constant.swift
//
//  Created by AAIT
//

import Foundation

// MARK: - Request Enums -

enum Server: String {
//https://takhawi.onrender.com/api/
   
    case baseURL = "https://dev-dash-takhawe.hayah.tech/api/"
    case socetURL = "https://writingservices.aait-sa.com:4705"
    case socetPort = "4705"
    case rechargeURL = "https://writingservices.aait-sa.com/wallet/charge/"
    case joinUsURL = "https://writingservices.aait-sa.com/option-register"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"

    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case lang = "Accept-Language" //"lang"
}
enum ContentType: String {
    case json = "application/json"
    case deviceType = "ios"
    case tokenBearer = "Bearer "
}

// MARK: - Response Enums -
enum APIServerResponseKey: String, Codable {
    case success
    case failed
    case exception
    case needActive
    case unauthenticated
    case blocked
}

// MARK: - Errors -
enum APIErrors: String {
    case connectionError
    case canNotDecodeData

}

// MARK: - Errors -
enum BaseParamterKeys: String {
    case countryId = "country_id"
    case cityId = "city_id"
    case categoryId = "category_id"
    case lat
    case long
    case type
}
