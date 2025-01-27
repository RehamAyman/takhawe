//
//  userRouter.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/07/2024.
//




import Foundation
import Alamofire

enum UserRouter {
    case createVipTrip( destinationLong : Double , destinationLat : Double , currentLat : Double , currentLong : Double , features : [String] , date : String , pickup_description : String , destination_description : String )
    case getAllVipOffers(id : Int)
    case acceptOffer ( id : Int , paymentMethod : String  , cardId : Int)
    case getAllCities ( page : Int)
    case getAllBasicTrips ( cityId : Int  , lat : Double , lng : Double , StartdDate : String , filter : String )
    case recentAddress
    case getOneTrip ( id : Int)
    case complain ( category : String , note : String , isComplain : Bool)
    case getProfile
    case addAddressToFav ( alias : String , lat : Double , lng : Double , isFav : Bool , desc : String )
    case claculateBasicPrice ( id : Int  , code : String)
    case joinABasicTrip ( id : Int , paymentMethod : String , copon : String , cardid : Int)
    case calculateVipPrice ( id : Int )
    case walletData ( page : Int)
    case getAllHobbies
    case updateProfile ( name : String , email : String , birthDate : String , bio : String , cityId : Int , gender : String , hobbies : [HobbiesClass])
    case getAllAddress
    case updateAddress ( id : Int , isFav : Bool)
    case getAllFavDrives ( page : Int)
    case removeDriverFromFav ( id : Int )
    case getMyUpcommingTrips ( type : String)
    case cancelBasicTrip ( userId : Int ,  id : Int , reason : String  )
    case cancelVipTrip ( id : Int , reason : String   )
    case getCancelledTrips( type : String )
    case getCompletedTrips ( type : String)
    case checkPromoCode( code : String )
    case getVip ( id : Int )
    case getOneGeneralTrip ( id : Int )
    case openChat ( tripId : Int , driverId : Int , userId : Int , ISdriver : Bool)
    case registerFcm(fcmTocken : String)
    case getPolices
    case aboutUs
    case getAllLastMessaged ( chatId : String )
    case getAllChats
    case getAllPaymentCards
    case switchRole
    case chargeWallet( amount : Int  , cardId : Int )
    case deleteAcc
    case getNotifications
    case getBillingInfo
    case createBillingInfo ( surname : String , street : String , cityId : Int , state : String)
    case getAllReviews ( id : Int)
    case rateTheDriver ( tripId : Int , driverId : Int , note : String , rate : Int)
  
}



extension UserRouter : APIRouter {
    var insideUrlParam: [String]? {
        return []
    }
    

    var method: HTTPMethod {
        switch self {
            
        case .createVipTrip , .acceptOffer  , .complain , .addAddressToFav , .claculateBasicPrice  , .joinABasicTrip , .calculateVipPrice , .checkPromoCode   , .openChat  , .registerFcm , .chargeWallet  , .createBillingInfo , .rateTheDriver  :
            return .post
        
            
        case .getAllVipOffers , .getAllCities , .getAllBasicTrips  , .recentAddress  , .getOneTrip , .getProfile , .walletData , .getAllHobbies  , .getAllAddress , .getAllFavDrives , .getMyUpcommingTrips , .getCancelledTrips , .getCompletedTrips , .getVip , .getOneGeneralTrip  , .getPolices  , .aboutUs , .getAllLastMessaged , .getAllChats  , .getAllPaymentCards , .switchRole , .getNotifications , .getBillingInfo  , .getAllReviews  :
          return .get
            
            
        case  .updateProfile :
            return .patch
            
            
        case .updateAddress:
            return .put
            
            
        case .removeDriverFromFav , .cancelVipTrip , .cancelBasicTrip , .deleteAcc:
            return .delete
        }
    }
    
    
    
    var path: ServerPath {
        switch self {
        case .createVipTrip :
            return userServerPath.careateVipTrip
        case .getAllVipOffers  ( id: let id ):
            return userServerPath.getVipOffers(id: id)
        case .acceptOffer(id: let id  , paymentMethod : let payment , cardId : let cardId):
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
        case .claculateBasicPrice(id: let id , code: _ ):
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
        case .getAllAddress :
            return userServerPath.getAllAddress
        case .updateAddress(id: let id , isFav: _) :
            return userServerPath.updateAddress(id: id)
        case .getAllFavDrives :
            return userServerPath.getFavDrivers
        case .removeDriverFromFav(id: let id):
            return userServerPath.removeDriverFromFav(id: id )
        case .getMyUpcommingTrips :
            return userServerPath.getMyUpcommingTrips
        case .cancelVipTrip(id: let id , reason: _ ):
            return userServerPath.cancelVipTrip(id: id)
        case .cancelBasicTrip(userId: let UserId , id: _, reason: _ ):
            return userServerPath.cancelBasicTrip(id: UserId )
        case .getCancelledTrips:
            return userServerPath.getCanselledTrips
        case .getCompletedTrips:
            return userServerPath.getCompletedTrips
        case .checkPromoCode:
            return userServerPath.checkPromoCode
        case .getVip(id: let id ) :
            return userServerPath.getOneVip(tripId: id)
        case .getOneGeneralTrip(id: let id ):
            return userServerPath.getOneGeneralTrip(tripId: id)
        case .openChat:
            return userServerPath.openChat
        case .registerFcm :
            return userServerPath.addFCMTocken
        case .getPolices:
            return userServerPath.getPolicies
        case .aboutUs:
            return userServerPath.aboutUs
        case .getAllLastMessaged(chatId: let id ) :
            return userServerPath.getAllLastMessages(chatid: id )
        case .getAllChats :
            return userServerPath.getAllMessages
        case .getAllPaymentCards :
            return userServerPath.getAllSavedCards
        case .switchRole:
            return userServerPath.switchRole
        case .chargeWallet:
            return userServerPath.chargeWallet
        case .deleteAcc :
            return userServerPath.deleteMyAcc
        case .getNotifications:
            return userServerPath.getNotifications
        case .getBillingInfo:
            return userServerPath.getBillingInfo
        case .createBillingInfo:
            return userServerPath.createbillingInfo
        case .getAllReviews(id: let id ) :
            return userServerPath.reviewsList(id: id )
        case .rateTheDriver :
            return userServerPath.rateTheDriver
    
        
            
            
        }
    }
    

    
    var parameters: APIParameters? {
        switch self {
        case .createVipTrip( let destinationLong , let destLat ,  let currentLat , let currentLong  ,  let features , let date  , let pickup_description , let destination_description  ):
            return [
               "destination_location_lat" : destLat ,
               "destination_location_lng" : destinationLong ,
               "pickup_location_lat" : currentLat ,
               "pickup_location_lng" : currentLong ,
               "features" : features ,
               "start_date" : date ,
               "pickup_description" : pickup_description  ,
               "destination_description" : destination_description 
            ]
            
        case .updateProfile(name: let name , email: let email , birthDate: let birthDate , bio: let bio , cityId: let cityId , gender: let gender , hobbies: let hobboies ) :
            var dict : [String : Any] = [
                "name" : name ,
                "email" : email ,
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
            if birthDate != "" {
                dict["birth_date"] = birthDate
            }
            if cityId != 0 {
                dict["cityId"] = cityId
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
        case .acceptOffer( _ ,  let method , let cardId ):
            var dic1 : [String : Any] = [ "payment_method" : method]
            if cardId != 0 {
                dic1["card_id"] = cardId
            }
            
            return dic1
          
        
        case .addAddressToFav(alias: let alias, lat: let lat , lng: let lng , isFav: let isFav , desc: let desc  ):
            return [
                "lat": lat ,
                "lng": lng ,
                "alias": alias ,
                "is_favorite": isFav ,
                "description" : desc
            ]
        case .getAllBasicTrips(cityId: let cityId , lat: let lat , lng: let lng  , StartdDate : let startdate ,filter: let filter  ):
            
            var dic : [String : Any ] = [
                "cityPickupId" : cityId ,
                "destinationLat" : lat ,
                "destinationLng" : lng ,
                "startDate" : startdate
            ]
            
            if filter != "" {
                dic["sortBy"] = filter
            }
            return dic
                
          
        case .createBillingInfo(surname: let surname , street: let street , cityId: let cityId , state: let state ):
            
            return [
                "cityId": cityId ,
                "state": state ,
                "street": street ,
                "surname": surname
            ]
            
            
            
            
        case .checkPromoCode(code: let code ):
            return [
                "code": code
            ]
        
        case .complain(category: let category , note: let note , isComplain: let isComplain ) :
            var dic : [String : Any] = [ "note" : note , "is_complaint" :  isComplain ]
            
            if isComplain {
               dic["category"]  =  category
            }
            return dic
            
        case .joinABasicTrip(id: let id , paymentMethod: let payment , copon : let copon , cardid : let cardId  ) :
            var dic1 : [String : Any]  = [
                "trip_id": id ,
                "payment_method": payment
            ]
            
            if copon != "" {
                dic1["coupon"] = copon
            }
            if cardId != 0 {
                dic1["card_id"] = cardId
            }
            return dic1
            
        case .updateAddress(id: _ , isFav: let isFav) :
            return [
                "is_favorite" : isFav
            ]
          
        case .getAllFavDrives( page : let page ) :
            return [
                "page" : page
                
            ]
            
        case .cancelBasicTrip(userId: _ , id: let id , reason: let reason ):
            return [
                "trip_id" : id  , 
                "reason" : reason
            ]
        case .cancelVipTrip(id: _ , reason: let reason ):
            return [
                "reason" : reason
            ]
            
        case .claculateBasicPrice(id: _ , code: let code ):
            var dic : [String : Any]  = [:]
            if code != "" {
                dic["coupon" ] = code
            }
            return dic
            
        case .getCompletedTrips(type: let type ) :
            var dic : [String : Any]  = [:]
            if type != "" {
                dic["type"] = type
            }
            return dic
       
        case .getCancelledTrips(type: let type ) :
            var dic : [String : Any]  = [:]
            if type != "" {
                dic["type"] = type
            }
            return dic
        
        case .getMyUpcommingTrips(type: let type ) :
            
            var dic : [String : Any]  = [:]
            if type != "" {
                dic["type"] = type
            }
            return dic
            
        case .registerFcm(fcmTocken: let tocken):
            return [
                "token" : tocken
            ]
            
            
            
        case .openChat(tripId: let  tripId , driverId: let driverid , userId : let userId ,  ISdriver : let isDriver ) :
            
            var dic : [String : Any]  = [ "tripId" : tripId]
            
            if isDriver {
                dic["userId"] = userId
            } else {
                dic["driverId"] = driverid
            }
        
            return dic 
         
            
        case .rateTheDriver(tripId: let tripId , driverId: let driverId , note: let note , rate: let rate ) :
            

            return [
                "trip_id": tripId,
                "rate": rate ,
                "target_id": driverId ,
                "note": note
            ]
            
            
                    
               
        case .chargeWallet(amount: let amount , cardId: let cardId ):
            return [
                "amount" : amount ,
                "cardId" : cardId
                
            ]
            
            
            
            
        case .getAllVipOffers  , .recentAddress , .getOneTrip , .getProfile   , .calculateVipPrice , .getAllAddress   , .removeDriverFromFav    , .getVip , .getOneGeneralTrip  , .getPolices , .aboutUs , .getAllLastMessaged , .getAllChats  , .getAllPaymentCards  , .switchRole , .deleteAcc  , .getNotifications , .getBillingInfo  , .getAllReviews :
            return nil
            
        }
    }
    
}
