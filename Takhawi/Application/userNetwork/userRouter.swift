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
    case acceptOffer ( id : Int , paymentMethod : paymentMethod )
    
}

extension UserRouter : APIRouter {
    var insideUrlParam: [String]? {
        return []
    }
    
 
    
    var method: HTTPMethod {
        switch self {
            
        case .createVipTrip , .acceptOffer :
            return .post
        
       case .getAllVipOffers:
          return .get
            
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
            
        case .acceptOffer(let id ,  let method):
            return [
                "payment_method" : method
            ]
        
        case .getAllVipOffers   :
            return nil
            
        }
    }
    
}
