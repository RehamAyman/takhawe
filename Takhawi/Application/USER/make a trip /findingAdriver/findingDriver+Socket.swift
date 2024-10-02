//
//  findingDriver+Socket.swift
//  Takhawi
//
//  Created by Reham Ayman on 19/03/1446 AH.
//

import UIKit
import SocketIO



extension findingAdriverVC   {
//MARK: - SOCKET OPENING METHODS

    
    
    func connectSocket () {
        print("🌏1------- connect socket connection ----- ")
        socketManager.connect()
        socketManager.listenToUserOffers { offers  in
            print("heey there ✅ success passed the offers ... ")
            self.didfindAdrivier?(offers )
            self.dismiss(animated: true )
            
        }
    }
    
   
    
    
    
    
    
}
