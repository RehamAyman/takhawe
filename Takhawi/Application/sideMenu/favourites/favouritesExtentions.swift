//
//  favouritesExtentions.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit


extension favoritesVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.displayedTask {
        case .locations :
            return self.dummyLocationData.count
        case .drivers :
            return self.dummyDriversData.count
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.displayedTask == .locations {
            let cell = tableView.dequeueReusableCell(withIdentifier: "favlocationCell" , for: indexPath) as! favlocationCell
            let item = self.dummyLocationData[indexPath.row]
            cell.cellSubTitle.text = item.locationDetails
            cell.cellTitle.text = item.location
            
            return cell
            
            
        } else {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "favDriverCell", for: indexPath) as! favDriverCell
            let item = self.dummyDriversData[indexPath.row]
            cell.driverName.text = item.title
            cell.reviewsLabel.text = item.subtitle
            
            return cell
            
        }
        
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
    
    
    
}
