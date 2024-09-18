//
//  APIGloabelResponse.swift
//
//  Created by AAIT
//

import Foundation

class APIGlobalResponse: Codable {
    //   var key: APIServerResponseKey?
    var status : Bool?
    var message : String = ""
    var paginate: Pagination?
  //  var resultt : Bool?
    
    
    enum CodingKeys: String, CodingKey {
        //   case key
        case message
        case status
        case paginate = "pagination"
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decode(String.self, forKey: .message)
        status = try values.decode(Bool.self, forKey: .status)
        paginate = try values.decodeIfPresent(Pagination.self, forKey: .paginate)
     
        
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
    let totalPages :  Int
    let totalItems : Int
    let page : Int
    let limit : Int

    enum CodingKeys: String, CodingKey {
        case totalPages = "totalPages"
        case totalItems = "totalItems"
        case page = "page"
        case limit = "limit"
       
    }
}



class CheckphoneResponse: Codable {
    //   var key: APIServerResponseKey?
    var status : Bool?
    var message : String = "" 
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


