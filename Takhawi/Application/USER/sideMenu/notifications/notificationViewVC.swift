//
//  notificationViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class notificationViewVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var tableView: UITableView!
    
//MARK: - Properties -
    
    
    var dummyNotifications : [dummyNotification] = []

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        if self.dummyNotifications.count == 0  {
            self.tableView.isHidden = true
        } else {
            self.tableView.isHidden = false
        }
       self.getAllNotifications()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: notificationCell.self)
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension notificationViewVC {
    func getAllNotifications () {
        print("------------")
        print(Date().ISO8601Format())
        activityIndicatorr.startAnimating()
        UserRouter.getNotifications.send { [weak self]  (response : APIGenericResponse<[notificationResult]>) in
            guard let self else { return }
            if let result = response.result {
        
                print("🫢--")
              
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

//MARK: - Routes -
extension notificationViewVC {
    
}
