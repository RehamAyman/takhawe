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
    case getOneBasicTripDetails ( id : Int)
    case complain
    case getProfile
    case addAddressToFavs
    case calculateBasicPrice ( id : Int )
    case joinAbasicTrip
    case calculateVipPrice ( id : Int )
    case getWalletData
    case getAllHobiies
    case updateProfile
    
   
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
        case .getOneBasicTripDetails(id: let id ) :
            return "basic-trip/\(id)"
        case .complain:
            return "complaint/"
        case .getProfile:
            return "user/profile"
        case .addAddressToFavs:
            return "address/"
        case .calculateBasicPrice( id : let id ):
            return "basic-trip/calculate-price/\(id)"
        case .joinAbasicTrip:
            return "basic-trip/join"
        case .calculateVipPrice(id: let id ):
            return "vip-trip/calculate-price/\(id)"
        case .getWalletData:
            return "wallet/user-transactions"
        case .getAllHobiies :
            return "hobby/"
        case .updateProfile:
            return "user/profile" 
    
        }
    }
}
