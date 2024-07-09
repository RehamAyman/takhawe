//
//  userPath.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/07/2024.
//

import Foundation
import Foundation
enum userServerPath {
   
    case careateVipTrip
    case getVipOffers( id : Int)
    case acceptOffer ( id : Int , paymentMethod : paymentMethod )
    
    
   
}

extension userServerPath : ServerPath {
    var value: String {
        switch self {
     
        
        case .careateVipTrip :
            return "vip-trip"
        case .getVipOffers(id: let id) :
            return "/vip-trip/offers/\(id)"
        case .acceptOffer( let id , let payment ) :
            return "vip-trip/accept-offer/\(id))"
    
        }
    }
}
