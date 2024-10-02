//
//  loginModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/05/2024.
//

import Foundation


struct LoginModelData : Codable {
    let user : User?
    let accessToken : String?
    let refreshToken : String?

    enum CodingKeys: String, CodingKey {

        case user = "user"
        case accessToken = "accessToken"
        case refreshToken = "refreshToken"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
        refreshToken = try values.decodeIfPresent(String.self, forKey: .refreshToken)
    }

}
