//
//  favouritesExtentions.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit


extension favoritesVC : UITableViewDelegate , UITableViewDataSource {
    
    //MARK: - TABLE VIEW METHODS
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.displayedTask {
        case .locations :
            return self.favAddress.count
        case .drivers :
            return self.favdrivers.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.displayedTask == .locations {
            let cell = tableView.dequeueReusableCell(withIdentifier: "favlocationCell" , for: indexPath) as! favlocationCell
            let item = self.favAddress[indexPath.row]
            cell.cellSubTitle.text = item.alias
            cell.cellTitle.text = item.alias
            cell.favIcon.addTapGesture {
                self.removeAddressFromFavs(id: item.id ?? 0)
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "favDriverCell", for: indexPath) as! favDriverCell
            let item = self.favdrivers[indexPath.row]
            cell.driverName.text = item.name
            cell.reviewsLabel.text =  "\(item.rating ?? 0)" + " " +  "(\(item.reviews ?? 0 ) reviews)"   //"4.3 (221 reviews)"
            let imageString = Server.imageBase.rawValue + (item.avatar ?? "")
            cell.driverProfile.setImage(image: imageString)
            cell.favIcon.addTapGesture {
                self.removeDriverFromList(id: item.id ?? 0 )
            }
            return cell
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.displayedTask == .drivers {
            if indexPath.row == self.favdrivers.count - 1 && !isLastPage {
                
                let page = self.pationation?.page ?? 0
                self.getMoreDrivers(page: page + 1 )
            }
        }
        
    }
    
    

private func getMoreDrivers (page : Int) {
    self.indicator.isHidden = false
    self.indicator.startAnimating()
    UserRouter.getAllFavDrives(page: page ).send { [weak self ] (response: APIGenericResponse<[FavDriverResult]>  ) in
        guard let self = self else { return }
        if let result = response.result {
            self.favdrivers += result
            if response.paginate?.page == response.paginate?.totalPages {
                self.isLastPage = true
            }
            self.pationation = response.paginate
            self.tableView.reloadData()
            self.indicator.isHidden = true
            self.indicator.stopAnimating()
        }
    }
}
    
    

    
    
    
}
