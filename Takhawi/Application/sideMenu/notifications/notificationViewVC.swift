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
    
    var dummyNotifications : [dummyNotification] = [
      dummyNotification(
        day: "Today", data:
                            [NotificationData(icon: "Group 39335", title: "Credit Card added!", subtitle: "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae") ,
                             NotificationData(icon: "Group 39343", title: "30% Special Discount!", subtitle: "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae")
                             ]
                       
                       
                       
                       ) ,
      
      dummyNotification(
        day: "Dec, 17 2023", data:
                            [NotificationData(icon: "Group 39335", title: "Payment Successfully!", subtitle: "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae") ,
                             NotificationData(icon: "Group 39343", title: "30% Special Discount!", subtitle: "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae")
                             ]
                       
                       
                       
                       )
      
      
      
    ]

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
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
    
}

//MARK: - Routes -
extension notificationViewVC {
    
}
