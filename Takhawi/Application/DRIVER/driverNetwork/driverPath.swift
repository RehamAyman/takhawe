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
    case insertReport
    case getAllReports
    case deleteCar ( id : Int )
    case switchToUser
    case requestStellemnt
    case driverEndBasicTrip  ( id : Int )
    case endVip ( id : Int )
    case addNewCar
    case reports ( month : Int )
    case getTotalProfit
    case reportDetails( id : Int )
    
    
   
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
        case .insertReport:
            return "warning/"
        case .getAllReports:
            return "warning/"
        case .deleteCar(id: let id ):
            return "vehicle/\(id)"
        case .switchToUser :
            return "user/switch-to-user"
        case .requestStellemnt :
            return "settlement-request" 
        case .driverEndBasicTrip(id: let id ) :
            return "basic-trip/end-trip/\(id)"
        case .endVip(id: let id ):
            return "vip-trip/end-trip/\(id)"
        case .addNewCar :
            return "vehicle/add-new-vehicle"
        case .reports(month: let month):
            return "driver-report/monthly-profit?noOfMonth=\(month)"
        case .getTotalProfit:
            return "driver-report?limit=200"
        case .reportDetails(id: let id ):
            return "driver-report/\(id)"
    
        }
    }
}
