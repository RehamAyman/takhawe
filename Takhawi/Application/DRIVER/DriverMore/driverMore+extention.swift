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
        self.openHelpAndSupport()
        self.openLanguage()
        self.openProfileInfo()
        self.openMessages()
        self.OpenEarningsView()
        self.openReports()
        self.switchRoleAction()
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
    
    
    private func openHelpAndSupport () {
        self.helpAndSupport.addTapGesture {
            let vc = helpAndSupportVC()
            self.push(vc)
        }
    }
    
    private func openLanguage () {
        self.languageView.addTapGesture {
            let vc = languageVC()
            self.push(vc)
        }
        
    }
    
    private func openProfileInfo () {
        self.personalInfo.addTapGesture {
            let vc = profileVC()
            vc.isDriver = true
            self.push(vc)
        }
    }
    
    private func openMessages () {
        self.messages.addTapGesture {
            let vc = messagesViewVC()
            self.push(vc)
        }
    }
    
    private func OpenEarningsView () {
        self.earningsView.addTapGesture {
            let vc = driverEarningsVC()
            self.push(vc)
        }
    }
    
    private func openReports ( ) {
        self.reportView.addTapGesture {
            let vc = driverReportVC()
            self.push(vc)
        }
    }
    
    private func switchRoleAction () {
        self.switchRole.addTapGesture {
            activityIndicatorr.startAnimating()
            DriverRouter.switchToUser.send { [weak self ] (response : APIGenericResponse<LoginModelData>  )  in
                guard let self = self else { return }
            
                if response.status == true {
                    if let data = response.result {
                        UserDefaults.user?.user?.role = role.user.rawValue
                        UserDefaults.accessToken = data.accessToken
                        // go to user home
                        UserDefaults.isLogin = true
                        let vc = homeVC()
                        let nav = CustomNavigationController(rootViewController: vc)
                        AppHelper.changeWindowRoot(vc: nav)
                    }
               
                    
                }
            }
        }
        
    }
}
