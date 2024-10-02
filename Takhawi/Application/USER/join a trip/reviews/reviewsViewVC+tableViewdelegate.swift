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
        headerTitle.text = "Reviews".localize + " (\(dummyreviews.count))"
        return dummyreviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! reviewCell
        let item = self.dummyreviews[indexPath.row]
        cell.comment.text = item.comment
        cell.userImage.image = UIImage(named: item.userPhoto)
        cell.userName.text = item.username
        cell.userrate.rating = item.review
        cell.userrate.isUserInteractionEnabled = false
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
