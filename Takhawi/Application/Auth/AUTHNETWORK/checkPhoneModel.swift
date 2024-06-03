//
//  checkPhoneModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/05/2024.
//

import Foundation


struct checkPhoneModel : Codable {
    let status : Bool?
    let message : String?
    let result : Bool?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case result = "result"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        result = try values.decodeIfPresent(Bool.self, forKey: .result)
    }

}
