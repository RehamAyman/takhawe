//
//  network+drivernotification.swift
//  Takhawi
//
//  Created by Reham Ayman on 22/05/1446 AH.
//

import UIKit


extension driverNotificationsViewController :  UITableViewDelegate, UITableViewDataSource {
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.dummyNotifications.count == 0  {
            self.tableView.isHidden = true
        } else {
            self.tableView.isHidden = false
        }
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
    
    
    
    
    
    func getAllNotifications () {
        print("------------")
        print(Date().ISO8601Format())
        activityIndicatorr.startAnimating()
        UserRouter.getNotifications.send { [weak self]  (response : APIGenericResponse<[notificationResult]>) in
            guard let self else { return }
            if let result = response.result {
                for i in result {
                    let newNotification = NotificationData(icon: i.type ?? "" , title: i.title ?? "" , subtitle: i.body ?? "" )
                    if self.checkIfToday(dateToCheck: i.createdAt ?? "") {
                        if let todayIndex = self.dummyNotifications.firstIndex(where: { $0.day == "Today".localize }) {
                            // Append the new notification to the data array of the "Today" section
                            dummyNotifications[todayIndex].data.append(newNotification)
                            self.tableView.reloadData()
                        }else  {
                            self.dummyNotifications.append(dummyNotification(day: "Today".localize, data: [newNotification]))
                            self.tableView.reloadData()
                        }
                    } else if self.checkIfYesterday(dateToCheck:  i.createdAt ?? "" ) {
                        if let todayIndex = self.dummyNotifications.firstIndex(where: { $0.day == "yesterday".localize }) {
                            // Append the new notification to the data array of the "Today" section
                            dummyNotifications[todayIndex].data.append(newNotification)
                            self.tableView.reloadData()
                        }else  {
                            self.dummyNotifications.append(dummyNotification(day: "yesterday".localize, data: [newNotification]))
                            self.tableView.reloadData()
                        }
                    } else {
                        if let todayIndex = self.dummyNotifications.firstIndex(where: { $0.day == "Other".localize }) {
                            // Append the new notification to the data array of the "Today" section
                            dummyNotifications[todayIndex].data.append(newNotification)
                            self.tableView.reloadData()
                        } else {
                            self.dummyNotifications.append(dummyNotification(day: "Other".localize, data: [newNotification]))
                            self.tableView.reloadData()
                        }
                    }
                }
            }
                                                                    
        }
        
        
    }
    
    private func  checkIfToday (dateToCheck : String ) -> Bool {
            
        // Create an ISO8601DateFormatter
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // Enable fractional seconds
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0) // Ensure it uses UTC

        if let parsedDate = isoFormatter.date(from: dateToCheck) {
            // Get the current date in UTC
            let currentDate = Date()
            let calendar = Calendar.current
            
            // Extract year, month, and day components for both dates
            let parsedComponents = calendar.dateComponents([.year, .month, .day], from: parsedDate)
            let todayComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
            
            // Compare the date components
            if parsedComponents == todayComponents {
                print("The given date is equal to today.")
                return true
            } else {
                print("The given date is NOT equal to today.")
                return false
            }
        } else {
            print("Invalid date string format.")
            return false
        }
    }
    
    
    private func checkIfYesterday (dateToCheck : String) -> Bool  {
        
             
        
        // Create an ISO8601DateFormatter
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // Enable fractional seconds
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0) // Ensure it uses UTC
        
        if let parsedDate = isoFormatter.date(from: dateToCheck ) {
            // Get the current date in UTC
            let currentDate = Date()
            let calendar = Calendar.current
            
            // Calculate yesterday's date by subtracting one day
            if let yesterdayDate = calendar.date(byAdding: .day, value: -1, to: currentDate) {
                // Extract year, month, and day components
                let parsedComponents = calendar.dateComponents([.year, .month, .day], from: parsedDate)
                let yesterdayComponents = calendar.dateComponents([.year, .month, .day], from: yesterdayDate)
                
                // Compare the date components
                if parsedComponents == yesterdayComponents {
                    print("The given date is yesterday.")
                    return true
                } else {
                    print("The given date is NOT yesterday.")
                    return false
                }
            } else {
                return false
            }
        } else {
            print("Invalid date string format.")
            return false
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
