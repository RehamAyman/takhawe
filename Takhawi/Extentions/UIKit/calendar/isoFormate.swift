//
//  isoFormate.swift
//  Takhawi
//
//  Created by Reham Ayman on 09/07/2024.
//

import Foundation


extension String {
    func convertFromIso() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        if  let theDate = dateFormatter.date(from: self) {
        let newDateFormater = DateFormatter()
        newDateFormater.dateFormat = "MMM d, h:mm a"  //"dd-MMM-yyyy"
        newDateFormater.locale  = Locale(identifier: "en")
        print(newDateFormater.string(from: theDate ))
            return newDateFormater.string(from: theDate )
        } else {
            return ""
        }
        
    }
    
    func convertFromIsoToTimee() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        if  let theDate = dateFormatter.date(from: self) {
        let newDateFormater = DateFormatter()
        newDateFormater.dateFormat = "h:mm a"  //"dd-MMM-yyyy"
        newDateFormater.locale  = Locale(identifier: "en")
        print(newDateFormater.string(from: theDate ))
            return newDateFormater.string(from: theDate )
        } else {
            return ""
        }
        
    }
    
    
    
}
