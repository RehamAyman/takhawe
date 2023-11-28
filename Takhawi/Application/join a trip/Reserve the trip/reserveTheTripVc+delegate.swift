//
//  reserveTheTripVc+delegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/11/2023.
//

import UIKit

extension ReserveTheTripVC : UITableViewDelegate , UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        self.tableviewHeight.constant = CGFloat(85 * self.DummyPaymentMethods.count) + 20
        return self.DummyPaymentMethods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reserveTheTripCell") as! reserveTheTripCell
        let  item = self.DummyPaymentMethods[indexPath.row]
        cell.hint.text = item.expireIn
        cell.iconimage.image = UIImage(named: item.icon)
        cell.title.text = item.number
        cell.selectionStyle = .none
       
            
       
        
        if item.type == "wallet" {
            cell.title.text = "My Wallet"
            cell.iconimage.image = UIImage(named: "empty-wallet")
            cell.hint.text = ""
            cell.hint.isHidden = true
            
        }
        if item.type == "cash" {
            cell.title.text = "Cash"
            cell.iconimage.image = UIImage(named: "money 1")
            cell.hint.text = ""
            cell.hint.isHidden = true
            
        }
        
        if item.selected == true {
            cell.title.text = "hello"
        }
        
     
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? reserveTheTripCell else {
            return
        }
        cell.checkMarkView.isHidden = false
        cell.checkMarkView.play()
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? reserveTheTripCell else {
            return
        }
        cell.checkMarkView.isHidden = true
           
       }
        
    
    

    
    
}
