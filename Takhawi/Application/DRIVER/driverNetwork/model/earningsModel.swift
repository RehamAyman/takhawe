//
//  earningsModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/08/1446 AH.
//

import Foundation



struct earningsModel : Codable {
    
    let totalProfit : Double?
    let totalTrips : Int?
    let driverWalletBalance : Double?
    let dailyRevenue : [dailyRevenue]?
    
}


struct dailyRevenue : Codable {
    let date : String?
    let driver_profit : Double?
    
}
