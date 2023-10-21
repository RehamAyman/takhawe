//
//  homeSearch+textfieldDelegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/10/2023.
//

import UIKit
import GoogleMaps
import GooglePlaces



extension homeSearchVC : UITextFieldDelegate  , UITableViewDelegate , UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentPlacesCell", for: indexPath) as! RecentPlacesCell
        
        cell.placeName.text = recentPlaces[indexPath.row].placeName
        cell.city.text = "Jeddah"
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    

    
    func textFieldDidBeginEditing(_ textField: UITextField) {

      }
    

    

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        dismissKeyboard()
     
    }
    
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
       {
           let touch = touches.first
           if touch?.view != self.popviewContainer
           { self.dismiss(animated: true, completion: nil) }
       }
    
    
    
}
