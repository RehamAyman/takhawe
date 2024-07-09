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
        return tableView == self.googleTableView ? self.results.count : recentPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentPlacesCell", for: indexPath) as! RecentPlacesCell
        if tableView ==  self.googleTableView  {
            cell.placeName.text = results[indexPath.row].accessibilityLabel
        } else {
            cell.placeName.text = recentPlaces[indexPath.row].placeName
            cell.city.text = "Jeddah"
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
//    
//    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RecentPlacesCell else {
            return
        }
        cell.checkMark.isHidden = false
        cell.checkMark.play()
        self.selectedPlace = cell.placeName.text ?? ""
      
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RecentPlacesCell else {
            return
        }
        cell.checkMark.stop()
        cell.checkMark.isHidden = true
           
       }
//    
    
    
    
    // text field methods
    
    

    
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
