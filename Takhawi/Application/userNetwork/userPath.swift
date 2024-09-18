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
    case getAllAddress
    case updateAddress ( id : Int )
    case getFavDrivers 
    case removeDriverFromFav ( id : Int)
    case getMyUpcommingTrips
    case getCompletedTrips
    case getCanselledTrips
    case cancelBasicTrip ( id : Int)
    case cancelVipTrip ( id : Int)
    case checkPromoCode
   
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
        case .getAllAddress:
            return "address/"
        case .updateAddress ( id : let id  ):
            return "address/\(id)"
        case .getFavDrivers:
            return "favorite-driver"
        case .removeDriverFromFav(id: let id ):
            return "favorite-driver/\(id)"
        case .getMyUpcommingTrips:
            return "trip/upcoming-trips?limit=100"
        case .getCompletedTrips:
            return "trip/completed-trips?limit=100"
        case .getCanselledTrips :
            return "trip/cancelled-trips?limit=100"
        case .cancelBasicTrip(id: let id ):
            return "basic-trip/cancel-by-passenger/\(id)"
        case .cancelVipTrip(id: let id ):
            return "vip-trip/\(id)"
        case .checkPromoCode:
            return "promo-code/check-code"
            
    
        }
    }
}
