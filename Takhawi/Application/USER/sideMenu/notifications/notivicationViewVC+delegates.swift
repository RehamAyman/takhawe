//
//  notivicationViewVC+delegates.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/12/2023.
//

import UIKit


extension  notificationViewVC : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dummyNotifications[section].data.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dummyNotifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "notificationCell" , for: indexPath) as! notificationCell
        let item =  self.dummyNotifications[indexPath.section].data[indexPath.row]
        cell.icon.image = UIImage(named: item.icon)
        cell.cellTitle.text = item.title
        cell.subTitle.text = item.subtitle
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  85
    }
  
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let item =  self.dummyNotifications[section].day
        return item
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
      if let headerView = view as? UITableViewHeaderFooterView {
          headerView.contentView.backgroundColor =  UIColor(named: "BackGroundColor")
          headerView.textLabel?.textColor = UIColor(named: "MainColor")
      }
  }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let contextItem = UIContextualAction(style: .destructive, title: "Delete".localize) {  (contextualAction, view, boolValue) in

                let section = indexPath.section
                let row = indexPath.row
                self.dummyNotifications[indexPath.section].data.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
               // self.tableView.deleteRows(at: [indexPath], with: .automatic)
                boolValue(true)
            }

            let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
            return swipeActions
        }
    
    
    
    
}
