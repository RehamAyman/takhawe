//
//  reportCancelVC+delegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 14/12/2023.
//


import UIKit


extension reportCancelVC : UITableViewDelegate , UITableViewDataSource {
    
 //MARK: - MAIN VIEW DESIGN METHODS
    
    func setupMainView () {
        noteText.label.text = "Note".localize
        noteText.handelTextArea(placeHolder: "Note".localize)
       
        if report {
            self.screenTitle.text = "Report an Issue".localize
            self.subTitleHint.text = "Please select the reason of Report".localize
        } else { // cancelation
            self.screenTitle.text = "Cancel Trip".localize
            self.subTitleHint.text = "Please select the reason of cancellation".localize
        }
    }
    
    
 //MARK: - TABLE VIEW METHODS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "reportOrCandelCell" , for: indexPath) as! reportOrCandelCell
       let item = self.items[indexPath.row]
        cell.title.text = item.name
        cell.selectionStyle = .none
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? reportOrCandelCell else {
            return
        }
        let item = self.items[indexPath.row]
            cell.checkBox.image = UIImage(named:"Element")
        self.selectedIndex = item.key
     
        
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? reportOrCandelCell else {
            return
        }
        cell.checkBox.image = UIImage(named:"Outer Rectangle")
    }
    
    //MARK: - CANCEL TRIP METHODS
    func cancelTrip ( tripId : Int  , type : String , passengerId : Int) {
            if type == "BASIC" {
                self.cancelBasicTrip(tripId: tripId, UserId: passengerId)
            } else {
                self.cancelVipTrip( id : tripId)
            }
        }
    
    

    private func cancelBasicTrip (tripId : Int , UserId : Int) {
            activityIndicatorr.startAnimating()
            UserRouter.cancelBasicTrip(userId: UserId , id: tripId , reason: self.selectedIndex ).send { [weak self ] (response: APIGlobalResponse )  in
                guard let self = self else { return }
                if response.status == true {
                    showPopTopAlert(title: "Done".localize , withMessage: response.message  , success: true )
                    self.moveToConfirmationPopUp()
                   
                }
            }
            
        }
        
        
        private func cancelVipTrip (id : Int) {
            activityIndicatorr.startAnimating()
            UserRouter.cancelVipTrip(id: id  , reason: self.selectedIndex).send { [weak self ] (response: APIGlobalResponse )  in
                guard let self = self else { return }
                if response.status == true {
                    showPopTopAlert(title: "Done".localize , withMessage: response.message  , success: true )
                    self.moveToConfirmationPopUp()
                   
                }
            }
        }
    
    
    private func moveToConfirmationPopUp () {
        let vc = cancelTheTripVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        
        if report  {
            vc.report = true
            self.present( vc , animated: true )
        } else {
            self.present( vc , animated: true )
        }
    }
}
