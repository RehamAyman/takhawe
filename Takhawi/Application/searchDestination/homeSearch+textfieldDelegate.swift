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
            var item = results[indexPath.row]
            cell.mainLbl.text = item.fullText
            cell.subLbl.text = item.secText
            if item.selected == true {
                cell.favIcon.image = UIImage(named: "Vector 4")
            }
            
            
            
            cell.favIcon.addTapGesture {
                print("hello , ...... ...")
                if  item.selected { // unfav
                   // cell.favIcon.image = UIImage(named: "heart (1) 1")
                    item.selected = false
                    self.googleTableView.reloadData()
                } else { // fav
                    
                    self.addPlaceToFav(alias: item.fullText ,placeId: item.placeID, isFav: true ) { bool  in
                        if bool {
                          //  cell.favIcon.image = UIImage(named: "Vector 4")
                            item.selected = true
                            self.googleTableView.reloadData()
                        }
                    }
                }
            }
            
            
            if self.selectedIndexPath == indexPath {
                cell.backgroundColor = UIColor(named: "secFavSeg")
          } else {
                
                cell.backgroundColor = UIColor.clear
            }
            
            
            
            cell.addTapGesture {
                
                if let selected = self.selectedIndexPath {
                    
                    let previousCell = tableView.cellForRow(at: selected)
                    previousCell?.backgroundColor = UIColor.clear // Reset previous cell background color
                }
                    // Select the new row
                    let currentCell = tableView.cellForRow(at: indexPath)
                    currentCell?.backgroundColor = UIColor(named: "secFavSeg") // Set the new cell background color
                   
                    self.selectedIndexPath = indexPath
                    self.selectedPlace = item.fullText
                    self.GetPlaceDataByPlaceID(pPlaceID: item.placeID)
                    self.selectedIndexPath = indexPath
                }
            
                //
              
                
          
            
            
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
    
    
    
    func getCoordinatesFromPlaceId ( placeid : String , completion: @escaping (Bool , Double , Double) -> Void ) {
        self.placesClient.lookUpPlaceID(placeid, callback: { (place, error) -> Void in
            if let error = error {
                print("lookup place id query error: \(error.localizedDescription)")
                completion( false , 0.0 , 0.0 )
                return
            }
            if let place = place {
                print(place.name ?? "--")
                print("lat : \(place.coordinate.latitude) , lng : \(place.coordinate.latitude)")
                completion( true  , place.coordinate.latitude , place.coordinate.longitude )
              
            } else {
                print("No place details for \(placeid)")
                completion( false , 0.0 , 0.0 )
            }
        })
    }
    
            func GetPlaceDataByPlaceID(pPlaceID: String )
            {
                self.placesClient.lookUpPlaceID(pPlaceID, callback: { (place, error) -> Void in
                    if let error = error {
                        print("lookup place id query error: \(error.localizedDescription)")
                        return
                    }
                    if let place = place {
                        print(place.name ?? "--")
                        self.selectedLat = place.coordinate.latitude
                        self.selectedLong = place.coordinate.longitude
                    } else {
                        print("No place details for \(pPlaceID)")
                    }
                })
            }
        
  
    
    func addPlaceToFav (alias : String , placeId : String  , isFav : Bool , completion: @escaping (Bool) -> Void ) {
        activityIndicatorr.startAnimating()
        self.getCoordinatesFromPlaceId(placeid: placeId) { bool , lat , lng  in
                    
            UserRouter.addAddressToFav(alias: alias , lat: lat , lng: lng , isFav: isFav ).send { [weak self ] (response : APIGlobalResponse ) in
                guard let self = self else { return }
                if response.status == true  {
                    completion(true )
                } else {
                    completion( false )
                }
                
            }
        }
    }
}
