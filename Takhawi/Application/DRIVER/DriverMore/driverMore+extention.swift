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
        self.openPolices()
        self.openAboutUs()
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
    
    
    //MARK: - OPEN POLICES
    private func openPolices () {
        polices.addTapGesture {
            let vc = policesVC()
            self.push(vc)
        }
    }
    
    
    private func openAboutUs () {
        aboutUs.addTapGesture {
            self.push(aboutUsVC())
        }
       
    }
    
    
}
