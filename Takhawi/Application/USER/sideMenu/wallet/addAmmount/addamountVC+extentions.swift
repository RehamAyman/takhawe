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
            self.showDropdown(image: cell.actionIcon , cardId : item.id ?? 0 )
        }
        
        if self.selectedCard == item.id {
            cell.mainView.backgroundColor = UIColor(named: "secFavSeg")
        } else {
            cell.mainView.backgroundColor = .systemGroupedBackground
        }
        
        
        cell.addTapGesture {
            self.selectedCard = item.id ?? 0
            tableView.reloadData()
           // self.chargeWallet(cardId: item.id ?? 0 )
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
    }
    
    
    
    func showDropdown(image : UIImageView  , cardId : Int) {
          // Create an action sheet styled alert
        let alert = UIAlertController(title: "Are You Sure To Delete This Card".localize, message: nil, preferredStyle: .actionSheet)
          // Add options (items) to the dropdown
        let item = "Delete".localize
        let action = UIAlertAction(title: item, style: .destructive) { (action) in
                  print("\(item) selected")
                  print(cardId)
            self.deleteCard(id: cardId)
                  // Handle the item selection here
                  
              }
              alert.addAction(action)
        
          
          // Add a cancel button
        let cancelAction = UIAlertAction(title: "Cancel".localize, style: .cancel, handler: nil)
          alert.addAction(cancelAction)
          
          // Present the alert
          if let popoverController = alert.popoverPresentationController {
              popoverController.sourceView = image
              popoverController.sourceRect = image.bounds
          }
          
          self.present(alert, animated: true, completion: nil)
      }
    
    func chargeWallet (cardId : Int  ) {
        if self.addAmountTextField.text == "" {
            showInfoTopAlert(withMessage: "please add amount first!")
        }  else  if cardId == 0 {
            showInfoTopAlert(withMessage: "please Select a Card first!".localize)
        } else {
            
            guard let amount = Int ( self.addAmountTextField.text ?? "0" )  else { return }
            activityIndicatorr.startAnimating()
            UserRouter.chargeWallet(amount: amount , cardId: cardId).send { [weak self ] ( response: APIGlobalResponse )  in
                guard let self = self else { return }
                if response.status == true {
                    self.action?()
                }
            }
        }
    }
    
    
    private func deleteCard ( id : Int) {
        activityIndicatorr.startAnimating()
        // 1 - delete the card
        // 2 - get all cards again to refresh the table view
        UserRouter.deleteBankCard(cardId: id ).send { [weak self] ( response : APIGlobalResponse ) in
            guard let self = self else { return }
                self.getAllSavedCards()
        }
        
        
    }
}


