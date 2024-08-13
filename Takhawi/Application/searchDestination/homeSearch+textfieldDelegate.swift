//
//  homeSearch+textfieldDelegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/10/2023.
//

import UIKit
import GoogleMaps
import GooglePlaces



extension homeSearchVC : UITableViewDelegate , UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == self.googleTableView ? self.results.count : recentPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if tableView ==  self.googleTableView  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "googleplacesCell", for: indexPath) as! googleplacesCell
            cell.mainLbl.text = results[indexPath.row].attributedFullText.string
            cell.subLbl.text = results[indexPath.row].attributedSecondaryText?.string
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentPlacesCell", for: indexPath) as! RecentPlacesCell
            cell.placeName.text = recentPlaces[indexPath.row].description
            cell.city.text = recentPlaces[indexPath.row].alias
            return cell
        }
        
       
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == googleTableView {
            return 70
        } else {
            return 60
        }
    }
    
//    
//    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == googleTableView {
            guard let cell = tableView.cellForRow(at: indexPath) as? googleplacesCell else {
                return
            }

            self.selectedPlace = cell.mainLbl.text ?? ""
            print(self.selectedPlace)
            
            
            let item = self.results[indexPath.row]
            cell.backgroundColor = UIColor(named: "secFavSeg")
            self.GetPlaceDataByPlaceID(pPlaceID: item.placeID)
                
            } else {
                guard let cell = tableView.cellForRow(at: indexPath) as? RecentPlacesCell else {
                    return
                }
                cell.checkMark.isHidden = false
                cell.checkMark.play()
                
                let item = self.recentPlaces[indexPath.row]
                self.selectedPlace = item.description ?? ""
                self.selectedLat = item.lat ?? 0.0
                self.selectedLong = item.lng ?? 0.0
            }
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if tableView == googleTableView {
            guard let cell = tableView.cellForRow(at: indexPath) as? googleplacesCell else {
                return
            }
            cell.backgroundColor = UIColor.clear
            
        } else {
            guard let cell = tableView.cellForRow(at: indexPath) as? RecentPlacesCell else {
                return
            }
            cell.checkMark.stop()
            cell.checkMark.isHidden = true
        }
  
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
    
    
            func GetPlaceDataByPlaceID(pPlaceID: String )
            {
              //  pPlaceID = "ChIJXbmAjccVrjsRlf31U1ZGpDM"
                self.placesClient.lookUpPlaceID(pPlaceID, callback: { (place, error) -> Void in

                    if let error = error {
                        print("lookup place id query error: \(error.localizedDescription)")
                        return
                    }

                    if let place = place {
                        print("Place name \(place.name)")
                        print("Place address \(place.formattedAddress!)")
                        print("Place placeID \(place.placeID)")
                        print("Place attributions \(place.attributions)")
                        print("\(place.coordinate.latitude)")
                        print("\(place.coordinate.longitude)")
                        self.selectedLat = place.coordinate.latitude
                        self.selectedLong = place.coordinate.longitude
                    } else {
                        print("No place details for \(pPlaceID)")
                    }
                })
            }
        
  
    
}
