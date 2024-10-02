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
    }
//
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        driver = try values.decodeIfPresent(Driver.self, forKey: .driver)
        pickup_location = try values.decodeIfPresent(Pickup_location.self, forKey: .pickup_location)
        destination = try values.decodeIfPresent(MDestination.self, forKey: .destination)
        passengerTripId = try values.decodeIfPresent(Int.self, forKey: .passengerTripId)
        Passenger = try values.decodeIfPresent(PassengerClass.self, forKey: .Passenger)
    }

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
    let name : String?
    let rate : Double?
    let image : String?
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case rate = "passenger_rate"
        case  image = "avatar"
    }
    
}
