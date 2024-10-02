//
//  driverMore+extention.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/03/1446 AH.
//

import Foundation



extension DriverMoreVC {
    

    
    func handleVCActions () {
        self.goToBasicTripsList()
        self.goToVipTrips()
    }
    
    
    
    
    
//MARK: - BASIC TRIP ACTION
    
   private func goToBasicTripsList () {
       basicView.addTapGesture {
        let vc = tripsSideMenuVC()
        vc.tripType = .basic
        vc.driver = true
           self.push(vc)
       }
    }
    
    
//MARK: - VIP  TRIP ACTION
    private func goToVipTrips () {
        vipV.addTapGesture {
            let vc = tripsSideMenuVC()
            vc.tripType = .vip
            vc.driver = true
            self.push(vc)
        }
    }
    
    
    
    
    
    
}
