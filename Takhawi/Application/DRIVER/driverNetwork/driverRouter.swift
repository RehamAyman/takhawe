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
    case getPrevVipTrips ( lat : Double , lng : Double)
    case makeOffer( id : Int , price : Int , features : [String] )
    case updateTripStatus ( id : Int , type : String )
    case markPassenger ( id : Int )
    case markReport ( lat : Double , lng : Double , enType : String   , arType : String )
    case getAllReports ( lat : Double , lng : Double )
    case deleteCar ( id : Int )
    case switchToUser
    case stellementRequest ( holderName : String , bankName : String , bankAccNo : String , iban : String , amount : Int)
    case endBasicTrip ( id : Int )
    case endVipTrip ( id : Int )
    case addNewCar ( serialNo : String , plateAlpha : String , plateNo : String , plateAlphaAr : String , year : Int , seatNo : Int , classId :Int , colorId :  Int , typeId : Int , nameId : Int )
    case report ( noOfMonths : Int )
    case getTotalProfit
    case reportDetails ( id : Int )
    case getVipByDistance ( distance : Int )
}

extension DriverRouter : APIRouter {
    var insideUrlParam: [String]? {
        return []
    }
    
 
    
    var method: HTTPMethod {
        switch self {
            
        case .createAvehicle , .createBasic , .makeOffer  , .markReport , .stellementRequest , .addNewCar  :
            return .post
        
        case  .driverStatus , .vehicleDetials , .getMeetingLocations , .getPrevVipTrips  , .getAllReports , .switchToUser , .report  , .getTotalProfit , .reportDetails , .getVipByDistance :
            
          return .get
            
        case .updateTripStatus , .markPassenger  , .endBasicTrip  , .endVipTrip:
            return .patch
            
        case .deleteCar :
            return .delete
            
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
        case .getPrevVipTrips :
            return driverServerPath.getPrevVipTrips
        case .makeOffer(id: let id , price: _ , features: _ ):
            return driverServerPath.makeOffer(id: id )
        case .updateTripStatus(id: let id , type: _):
            return driverServerPath.updateTripStatus(id: id)
        case .markPassenger(id: let id ):
            return driverServerPath.markPassengerAttend(id: id )
        case .markReport :
            return driverServerPath.insertReport
        case .getAllReports :
            return driverServerPath.getAllReports
       
        case .deleteCar(id: let id ):
            return driverServerPath.deleteCar(id: id)
        case .switchToUser:
            return driverServerPath.switchToUser
        case .stellementRequest:
            return driverServerPath.requestStellemnt
        case .endBasicTrip(id: let id ):
            return driverServerPath.driverEndBasicTrip(id: id)
        case .endVipTrip(id: let id ):
            return driverServerPath.endVip(id: id )
        case .addNewCar :
            return driverServerPath.addNewCar
        case .report(noOfMonths: let months ):
            return driverServerPath.reports(month: months)
        case .getTotalProfit :
            return driverServerPath.getTotalProfit
        case .reportDetails(id: let id ):
            return driverServerPath.reportDetails(id: id)
        case .getVipByDistance(distance: let distance ) :
            return driverServerPath.getVipByDistance
            
            
       
        }
    }
    

    
    var parameters: APIParameters? {
        switch self {
        case .updateTripStatus(id: _  , type: let type ):
            return [
                "status" : type
            ]
           
      
            
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
                "vehicle_name_id": name ,
                "plate_alphabet_ar" : "aaa"
            ]
            
        case .getPrevVipTrips(lat: let lat , lng: let lng ):
            return [
                "lat" : lat ,
                "lng" : lng
            ]
            
        case .createBasic(endDate: let endDate, startDate: let startDate , seatsNo: let seats , PickLocationId: let pickLocation , destLocationId: let destLocation , features: let features  , price : let price ):
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
         
        case .makeOffer(id: _ , price: let price , features: let features ) :
            return [
                "price": price ,
                   "features": features
            ]
            
        case .markReport(lat: let lat , lng: let lng , enType: let enType , arType: let arType ) :
         //   var additionJson1 = [String:Any]()
            let additionJson1 = [
                 "lat" : lat ,
                 "lng" : lng
                 ] as [String : Any]
            let activitesData1 = try? JSONSerialization.data(withJSONObject: additionJson1, options: .prettyPrinted)
            let string1 = String(data: activitesData1!, encoding: String.Encoding.utf8)!
            
            
            return [
                "en_type"  : enType ,
                "ar_type" : arType ,
                "location" : additionJson1
            ]
            
            
        case .getAllReports(lat: let lat , lng: let lng ) :
            return [
                "lat" : lat ,
                "lng" : lng
            ]
            
        case .stellementRequest(holderName: let holderName , bankName: let bankName, bankAccNo: let bankAccNo , iban: let iban , amount: let ammount ):
            return [
                "holder_name": holderName ,
                "bank_name": bankName ,
                "bank_account_number": bankAccNo ,
                "iban": iban ,
                "amount": ammount
            ]
            
            
            
        case .addNewCar(serialNo:  let serialNo , plateAlpha: let plateAlpha , plateNo: let plateNo , plateAlphaAr: let plateAr , year: let year , seatNo: let seatNo , classId: let classId , colorId: let colorId , typeId: let typeId , nameId: let nameId ) :
            return [
                
                "serial_no" : serialNo ,
                "plate_alphabet" :  plateAlpha ,
                "plate_alphabet_ar" :  plateAr ,
                "plate_number" :  plateNo ,
                "production_year" :  year ,
                "seats_no" :  seatNo ,
                "vehicle_class_id" : classId ,
                "vehicle_color_id" : colorId ,
                "vehicle_type_id" :  typeId ,
                "vehicle_name_id" : nameId
            ]
            
            
        case .getVipByDistance(distance: let distance):
            return [
                "distance" : distance
            ]
     
          
            
            
        case  .driverStatus , .vehicleDetials  , .markPassenger    , .deleteCar , .switchToUser , .endBasicTrip , .endVipTrip  , .report , .getTotalProfit , .reportDetails :
            return nil
            
        }
    }
    
}
