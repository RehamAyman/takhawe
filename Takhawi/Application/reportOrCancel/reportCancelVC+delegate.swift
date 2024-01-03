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
        cell.title.text = item
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
        
            cell.checkBox.image = UIImage(named:"Element")
          

        
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? reportOrCandelCell else {
            return
        }
        cell.checkBox.image = UIImage(named:"Outer Rectangle")
    }
    
    
    
}
