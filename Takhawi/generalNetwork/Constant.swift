//
//  Constant.swift
//
//  Created by AAIT
//

import Foundation

// MARK: - Request Enums -

enum Server: String {
//https://takhawi.onrender.com/api/
 //"https://dev-dash-takhawe.hayah.tech/api/"
 //"https://api.takhawe.com/api/"
    // https://api.takhawe.com
    
    
//    VITE_BASE_URL = 'https://api.takhawe.com/api/'
//    VITE_MEDIA_URL = 'https://api.takhawe.com'
//
//    
    case baseURL =  "https://api.takhawe.com/api/"   //"https://dev-dash-takhawe.hayah.tech/api/"
   // case socetURL = "https://api.takhawe.com/"  //"https://dev-dash-takhawe.hayah.tech"
    case socetPort = "3000"
    case rechargeURL = "https://writingservices.aait-sa.com/wallet/charge/"
    case joinUsURL = "https://writingservices.aait-sa.com/option-register"
    case imageBase =   "https://api.takhawe.com/" //"https://dev-dash-takhawe.hayah.tech/"
    
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
