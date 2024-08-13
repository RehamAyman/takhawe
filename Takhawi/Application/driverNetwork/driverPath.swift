//
//  driverPath.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/07/2024.
//

import Foundation


enum driverServerPath {
   
    case checkStatus
    case vehicleDetails
    case createAVehicle
    
    
    
   
}

extension driverServerPath : ServerPath {
    var value: String {
        switch self {
     
        
        case .checkStatus :
            return "driver/check-status"
        case .vehicleDetails:
            return "vehicle-details"
        case .createAVehicle:
            return "vehicle/"
    
        }
    }
}
