//
//  addamountVC+extentions.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit


extension addAmountVC : UITableViewDelegate , UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardsCell", for: indexPath) as! cardsCell
        cell.selectionStyle = .none 
        let item = self.myCards[indexPath.row]
        cell.visaNumbers.text = "**** **** **** \(item.card_number ?? "" )"
        cell.visaExpirationDate.text = ( item.card_exp_month ?? "" )  + "-" + (item.card_exp_year ?? "" )
        
        cell.actionIcon.addTapGesture {
            self.showDropdown(image: cell.actionIcon)
        }
       
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    
    func showDropdown(image : UIImageView ) {
          // Create an action sheet styled alert
          let alert = UIAlertController(title: "Are You Sure To Delete This Card", message: nil, preferredStyle: .actionSheet)
          // Add options (items) to the dropdown
          let items = ["Delete"]
          for item in items {
              let action = UIAlertAction(title: item, style: .destructive) { (action) in
                  print("\(item) selected")
                  
                  // Handle the item selection here
              }
              alert.addAction(action)
          }
          
          // Add a cancel button
          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
          alert.addAction(cancelAction)
          
          // Present the alert
          if let popoverController = alert.popoverPresentationController {
              popoverController.sourceView = image
              popoverController.sourceRect = image.bounds
          }
          
          self.present(alert, animated: true, completion: nil)
      }
    
}


