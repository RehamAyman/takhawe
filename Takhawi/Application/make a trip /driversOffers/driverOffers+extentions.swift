//
//  driverOffers+extentions.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//

import UIKit


extension driverOffersVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.dummyOffers.count == 0 {
            self.noOffersView.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.animationView.play()
                self.noOffersViewHeight.constant = 300
            }
        } else {
            self.noOffersView.isHidden = true
            self.noOffersViewHeight.constant = 0
        }
        return self.dummyOffers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "driversOffersCell", for: indexPath) as! driversOffersCell
        let item = self.dummyOffers[indexPath.row]
        
        cell.driverName.text = item.driverName
        cell.driverRate.rating = item.driverRate
        cell.driverPhoto.image = UIImage(named: item.driverPhoto)
        cell.action = {
            
        }
        cell.cancel = {
         //   self.tableview.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
            self.dummyOffers.remove(at: indexPath.row)
            
            UIView.animate(withDuration: 0.5) {
                
                tableView.reloadData()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    
}
