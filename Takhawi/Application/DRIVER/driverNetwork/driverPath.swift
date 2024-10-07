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
    case createBasicTrip
    case meetingLocations
    case getPrevVipTrips
    case makeOffer ( id : Int)
    case updateTripStatus ( id : Int )
    case markPassengerAttend ( id : Int )
    
    
   
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
        case .createBasicTrip:
            return "basic-trip/" 
        case .meetingLocations:
         return "meeting-location/"
        case .getPrevVipTrips:
            return "trip/nearby-vip-trips"
        case .makeOffer(id: let id ):
            return "vip-trip/make-offer/\(id)"
        case .updateTripStatus(id: let id ):
            return "trip/trip-status/\(id)"
        case .markPassengerAttend(id: let id ):
            return "basic-trip/mark-as-arrived/\(id)"
    
        }
    }
}
