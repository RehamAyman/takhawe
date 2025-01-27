//
//  reviewsViewVC+tableViewdelegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/11/2023.
//

import UIKit


extension reviewsViewVC  : UITableViewDelegate , UITableViewDataSource {
 
    //MARK: - TABLE VIEW METHODS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        headerTitle.text = "Reviews".localize + " (\(self.allReviews.count))"
        return self.allReviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! reviewCell
        let item = self.allReviews[indexPath.row]
        cell.comment.text = item.note
      
        cell.userImage.image = UIImage(named: "Group 1000002907")
        if let image = item.Reviewers?.avatar {
            cell.userImage.setImage(image: image)
        }
            
        cell.userName.text = item.Reviewers?.name ?? ""
        cell.userrate.rating =  item.rate ?? 0
        cell.userrate.isUserInteractionEnabled = false
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
