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
    
}

extension DriverRouter : APIRouter {
    var insideUrlParam: [String]? {
        return []
    }
    
 
    
    var method: HTTPMethod {
        switch self {
            
        case .createAvehicle :
            return .post
        
        case  .driverStatus , .vehicleDetials :
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
        
        case  .driverStatus , .vehicleDetials  :
            return nil
            
        }
    }
    
}
