//
//  userPath.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/07/2024.
//


import Foundation
enum userServerPath {
   
    case careateVipTrip
    case getVipOffers( id : Int)
    case acceptOffer ( id : Int  , paymentMethod : String)
    case allCityies
    case getAllBasicTrips
    case recentAddress
  
    
    
   
}

extension userServerPath : ServerPath {
    var value: String {
        switch self {
     
        
        case .careateVipTrip :
            return "vip-trip"
        case .getVipOffers(id: let id) :
            return "/vip-trip/offers/\(id)"
        case .acceptOffer( let id ,   _ ) :
            return "vip-trip/accept-offer/\(id)"
        case .allCityies:
            return "city/"
        case .getAllBasicTrips:
            return "basic-trip/"
        case .recentAddress:
            return "recent-address"
      
    
        }
    }
}
