//
//  APIGloabelResponse.swift
//
//  Created by AAIT
//

import Foundation

class APIGlobalResponse: Codable {
    //   var key: APIServerResponseKey?
    var status : Bool?
    var message : String?
  //  var resultt : Bool?
    
    
    enum CodingKeys: String, CodingKey {
        //   case key
        case message
        case status
      //  case resultt = "result"
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //   key = try values.decode(APIServerResponseKey.self, forKey: .key)
        message = try values.decode(String.self, forKey: .message)
        status = try values.decode(Bool.self, forKey: .status)
      //  resultt = try values.decodeIfPresent(Bool.self, forKey: .resultt )
        
    }
    
}


class APIGenericResponse<T: Codable>: APIGlobalResponse {
    
    var result: T?
    
    enum CodingKeys: String, CodingKey {
        case result
        case key = "status"
        case message
       
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status  = try values.decode(Bool.self , forKey: .key )
        message = try values.decode(String.self, forKey: .message)
        result = try values.decodeIfPresent(T.self, forKey: .result )
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



class CheckphoneResponse: Codable {
    //   var key: APIServerResponseKey?
    var status : Bool?
    var message : String?
    var resultt : Bool?
    
    
    enum CodingKeys: String, CodingKey {
        //   case key
        case message
        case status
        case resultt = "result"
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //   key = try values.decode(APIServerResponseKey.self, forKey: .key)
        message = try values.decode(String.self, forKey: .message)
        status = try values.decode(Bool.self, forKey: .status)
        resultt = try values.decodeIfPresent(Bool.self, forKey: .resultt )
        
    }
    
}
