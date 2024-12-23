//
//  mainTripModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 09/03/1446 AH.
//

import Foundation


struct MainTripResult : Codable {
    let id : Int?
    let start_date : String?
    let status : String?
    let type : String?
    let driver : Driver?
    let pickup_location : Pickup_location?
    let destination : MDestination?
    let  passengerTripId : Int?
    let  Passenger : PassengerClass?
    let  Passengers : [Passengers]?
    
   
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case start_date = "start_date"
        case status = "status"
        case type = "type"
        case driver = "Driver"
        case pickup_location = "pickup_location"
        case destination = "destination"
        case passengerTripId = "passengerTripId"
        case Passenger = "Passenger"
        case Passengers = "Passengers"
    }

 

}




struct passengerList : Codable{
    let id : Int?
    let passenger : PassengerClass?
    let status : String?
}
struct Pickup_location : Codable {
    let lat : Double?
    let lng : Double?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }

}


struct Pickuplocation1 : Codable {
    
    let description : String?

    enum CodingKeys: String, CodingKey {

        case description = "description"
    }

 

}

struct MDestination : Codable {
    let lat : Double?
    let lng : Double?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }

}
  


struct PassengerClass : Codable   {
    let id : Int?
    let name : String?
    let rate : Double?
    let image : String?
    
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case rate = "passenger_rate"
        case  image = "avatar"
        case id = "id"
    }
    
}



struct Passengers : Codable {
    let id : Int?
    var status : String?
    let payment_method : String?
    let passnger : Passnger?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case status = "status"
        case passnger = "Passnger"
        case payment_method = "payment_method"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        passnger = try values.decodeIfPresent(Passnger.self, forKey: .passnger)
        payment_method = try values.decodeIfPresent(String.self, forKey: .payment_method)
    }

}
struct Passnger : Codable {
    let id : Int?
    let name : String?
    let avatar : String?
    let passenger_rate : Double?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case avatar = "avatar"
        case passenger_rate = "passenger_rate"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        passenger_rate = try values.decodeIfPresent(Double.self, forKey: .passenger_rate)
    }

}
