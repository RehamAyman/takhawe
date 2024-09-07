//
//  userRouter.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/07/2024.
//




import Foundation
import Alamofire

enum UserRouter {
    case createVipTrip( destinationLong : Double , destinationLat : Double , currentLat : Double , currentLong : Double , features : [String] , date : String)
    case getAllVipOffers(id : Int)
    case acceptOffer ( id : Int , paymentMethod : String )
    case getAllCities ( page : Int)
    case getAllBasicTrips ( cityId : Int  , lat : Double , lng : Double , StartdDate : String)
    case recentAddress
    case getOneTrip ( id : Int)
    case complain ( category : String , note : String , isComplain : Bool)
    case getProfile
    case addAddressToFav ( alias : String , lat : Double , lng : Double , isFav : Bool)
    case claculateBasicPrice ( id : Int )
    case joinABasicTrip ( id : Int , paymentMethod : String , copon : String)
    case calculateVipPrice ( id : Int )
    case walletData ( page : Int)
    case getAllHobbies
    case updateProfile ( name : String , email : String , birthDate : String , bio : String , cityId : Int , gender : String , hobbies : [HobbiesClass])
}

extension UserRouter : APIRouter {
    var insideUrlParam: [String]? {
        return []
    }
    
 
    
    var method: HTTPMethod {
        switch self {
            
        case .createVipTrip , .acceptOffer  , .complain , .addAddressToFav , .claculateBasicPrice  , .joinABasicTrip , .calculateVipPrice  :
            return .post
        
        case .getAllVipOffers , .getAllCities , .getAllBasicTrips  , .recentAddress  , .getOneTrip , .getProfile , .walletData , .getAllHobbies :
          return .get
            
            
        case  .updateProfile :
            return .patch
            
        }
    }
    
    
    
    var path: ServerPath {
        switch self {
        case .createVipTrip :
            return userServerPath.careateVipTrip
        case .getAllVipOffers  ( id: let id ):
            return userServerPath.getVipOffers(id: id)
        case .acceptOffer(id: let id  , paymentMethod : let payment):
            return userServerPath.acceptOffer(id: id, paymentMethod: payment )
        case .getAllCities:
            return userServerPath.allCityies
        case .getAllBasicTrips:
            return userServerPath.getAllBasicTrips
        case .recentAddress:
            return userServerPath.recentAddress
        case .getOneTrip ( id : let id ):
            return userServerPath.getOneBasicTripDetails ( id:  id)
        case .complain :
            return userServerPath.complain
        case .getProfile :
            return userServerPath.getProfile
        case .addAddressToFav :
          return  userServerPath.addAddressToFavs
        case .claculateBasicPrice(id: let id ):
            return userServerPath.calculateBasicPrice(id: id )
        case .joinABasicTrip :
            return userServerPath.joinAbasicTrip
        case .calculateVipPrice(id: let id ) :
            return userServerPath.calculateVipPrice(id: id )
        case .walletData:
            return userServerPath.getWalletData
        case .getAllHobbies:
            return userServerPath.getAllHobiies
        case .updateProfile :
            return userServerPath.updateProfile
        }
    }
    

    
    var parameters: APIParameters? {
        switch self {
        case .createVipTrip( let destinationLong , let destLat ,  let currentLat , let currentLong  ,  let features , let date ):
            return [
               "destination_location_lat" : destLat ,
               "destination_location_lng" : destinationLong ,
               "pickup_location_lat" : currentLat ,
               "pickup_location_lng" : currentLong ,
               "features" : features ,
               "start_date" : date
            ]
            
        case .updateProfile(name: let name , email: let email , birthDate: let birthDate , bio: let bio , cityId: let cityId , gender: let gender , hobbies: let hobboies ) :
            var dict : [String : Any] = [
                "name" : name ,
                "email" : email ,
           //     "birth_date" : birthDate ,
             
                "cityId" :  cityId ,
                "gender" : gender
            ]
            var index = 0
            for i in hobboies {
                dict["hobbies[\(index)]"] = i.id
                index += 1
            }
            if bio != "" {
                dict["bio"] = bio
            }
            return dict
           
        case .getAllHobbies :
            return [
                "limit" : 60
            ]
            
        case .walletData(page: let page ) :
            return [
                "page" : page ,
                "limit" : 50
            ]
            
        case .getAllCities (let page ):
            return [
                "page" : page ,
                "limit" : 100
            ]
        case .acceptOffer( _ ,  let method):
            return [
                "payment_method" : method
            ]
        
        case .addAddressToFav(alias: let alias, lat: let lat , lng: let lng , isFav: let isFav ):
            return [
                "lat": lat ,
                "lng": lng ,
                "alias": alias ,
                "is_favorite": isFav
            ]
        case .getAllBasicTrips(cityId: let cityId , lat: let lat , lng: let lng  , StartdDate : let startdate):
            
            return [
                "cityPickupId" : cityId ,
                "destinationLat" : lat ,
                "destinationLng" : lng ,
                "startDate" : startdate
            ]
        
            
        case .complain(category: let category , note: let note , isComplain: let isComplain ) :
            var dic : [String : Any] = [ "note" : note , "is_complaint" :  isComplain ]
            
            if isComplain {
               dic["category"]  =  category
            }
            return dic
            
        case .joinABasicTrip(id: let id , paymentMethod: let payment , copon : let copon  ) :
            var dic1 : [String : Any]  = [
                "trip_id": id ,
                "payment_method": payment
            ]
            
            if copon != "" {
                dic1["coupon"] = copon
            }
            return dic1
            
          
            
        case .getAllVipOffers  , .recentAddress , .getOneTrip , .getProfile  , .claculateBasicPrice , .calculateVipPrice   :
            return nil
            
        }
    }
    
}
