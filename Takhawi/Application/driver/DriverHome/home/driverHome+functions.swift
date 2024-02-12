//
//  driverHome+functions.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/02/2024.
//

import UIKit

extension DriverHomeVC {
    
    
    func switchButtonAction() {
        self.switchButton.action = {
            print(self.switchButton.status)
            if self.switchButton.status { // on
                self.handleOnView()
            } else { // off
                self.handelOffView()
            }
        }
    }
    
    
    
    
   private func handelOffView () {
        
    }
    
    
  private  func handleOnView  () {
        
        
        
    }
    
    
  
    
    
    
    
    
    
}

