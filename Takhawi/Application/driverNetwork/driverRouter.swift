//
//  driverRouter.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/07/2024.
//


import Foundation
import Alamofire



enum DriverRouter {

    case driverStatus
    case vehicleDetials
    case createAvehicle ( serialNum : String , plateAlphabet : String , plateNum : String , year : Int , seats : Int , class : Int , color : Int , type : Int , name : Int)
    case createBasic (endDate : String , startDate : String , seatsNo : Int , PickLocationId  : Int  , destLocationId : Int , features : [String]   , price : Int  )
    
    case getMeetingLocations
}

extension DriverRouter : APIRouter {
    var insideUrlParam: [String]? {
        return []
    }
    
 
    
    var method: HTTPMethod {
        switch self {
            
        case .createAvehicle , .createBasic  :
            return .post
        
        case  .driverStatus , .vehicleDetials , .getMeetingLocations :
          return .get
            
        }
    }
    
    
    
    var path: ServerPath {
        switch self {
        
        case .driverStatus:
            return driverServerPath.checkStatus
        case .vehicleDetials:
            return driverServerPath.vehicleDetails
        case .createAvehicle :
            return driverServerPath.createAVehicle
        case .createBasic :
            return driverServerPath.createBasicTrip
        case .getMeetingLocations :
            return driverServerPath.meetingLocations
  
       
        }
    }
    

    
    var parameters: APIParameters? {
        switch self {
        case .createAvehicle(serialNum: let serialNum , plateAlphabet: let plateAlpha, plateNum: let plateNum , year: let year , seats: let seats , class: let classNum , color: let color, type: let type , name: let name ):
            return [
                "serial_no": serialNum ,
                 "plate_alphabet": plateAlpha ,
                 "plate_number": plateNum ,
                 "production_year": year ,
                 "seats_no": seats ,
                 "vehicle_class_id": classNum ,
                 "vehicle_color_id": color ,
                 "vehicle_type_id": type ,
                 "vehicle_name_id": name
            ]
            
        case .createBasic(endDate: let endDate , startDate: let startDate , seatsNo: let seats , PickLocationId: let pickLocation , destLocationId: let destLocation , features: let features  , price : let price ):
            return [
                
                    "end_date": endDate ,
                    "start_date": startDate ,
                    "seats_no": seats ,
                    "price_per_seat":  price ,
                    "pickup_location_id":  pickLocation ,
                    "destination_id": destLocation,
                    "features": features 
                   
            ]
              
        case .getMeetingLocations:
            return [
                "limit" : 100
            ]
         
        
        case  .driverStatus , .vehicleDetials   :
            return nil
            
        }
    }
    
}
