//
//  offersModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/07/2024.
//

import Foundation





struct  driverUpdateLocation : Codable {
    let lat : Double
    let lng : Double
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
}



struct updateStatusResult : Codable {
  
    let status : String?
    let tripId : Int?
    let driverId :  Int?
    
    
}



struct offerResult : Codable {
    let id : Int?
    let price : Double?
    let app_share_discount : Int?
    let status : String?
    let features : [String]?
    let driver_id : Int?
    let trip_id : Int?
    let createdAt : String?
    let driver : Driver?
    //let Vehicle_Color : itemObj?
  //  let Vehicle_Class : itemObj?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case price = "price"
        case app_share_discount = "app_share_discount"
        case status = "status"
        case features = "features"
        case driver_id = "driver_id"
        case trip_id = "trip_id"
        case createdAt = "createdAt"
        case driver = "Driver"
        
        
    }


}





struct AdditionalDriver : Codable {
    let name : String?
    let avatar : String?
    let driver_rate : Double?
   // let vehicles : Vehicles?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case avatar = "avatar"
        case driver_rate = "driver_rate"
      //  case vehicles = "Vehicles"
    }


}


struct Driver : Codable {
   
    let name : String?
    let avatar : String?
    let driver_rate : Double?
    let vehicles : Vehicles?
   

    enum CodingKeys: String, CodingKey {
     
        case name = "name"
        case avatar = "avatar"
        case driver_rate = "driver_rate"
        case vehicles = "Vehicles"
        
       
    }


}

struct GDriver : Codable {
    let name : String?
    let avatar : String?
    let driver_rate : Double?
    let vehicles : Vehicles?
    let phone : String?
    let id : Int?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case avatar = "avatar"
        case driver_rate = "driver_rate"
        case vehicles = "Vehicles"
        case phone = "phone"
        case id = "id"
    }


}


struct Vehicles : Codable {
    let id : Int?
    let serial_no : String?
    let plate_alphabet : String?
    let plate_alphabet_ar : String?
    let plate_number : String?
    let seats_no : Int?
    let production_year : Int?
    let vehicle_Color : itemObj?
    let vehicle_Class : itemObj?
    let vehicle_Type : itemObj?
    let vehicle_Name : itemObj?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case serial_no = "serial_no"
        case plate_alphabet = "plate_alphabet"
        case plate_alphabet_ar = "plate_alphabet_ar"
        case plate_number = "plate_number"
        case seats_no = "seats_no"
        case production_year = "production_year"
        case vehicle_Color = "Vehicle_Color"
        case vehicle_Class = "Vehicle_Class"
        case vehicle_Type = "Vehicle_Type"
        case vehicle_Name = "Vehicle_Name"
    }
    
}
    
//itemObj
struct itemObj : Codable {
    let name : String?
    

    enum CodingKeys: String, CodingKey {

        case name = "name"
       
    }

   
 

}




