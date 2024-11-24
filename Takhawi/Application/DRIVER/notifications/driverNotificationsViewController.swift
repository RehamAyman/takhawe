//
//  driverNotificationsViewController.swift
//  Takhawi
//
//  Created by Reham Ayman on 22/05/1446 AH.
//

import UIKit

class driverNotificationsViewController: UIViewController {
   

    @IBOutlet weak var tableView: UITableView!
    
    var dummyNotifications : [dummyNotification] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: notificationCell.self)
        if self.dummyNotifications.count == 0  {
            self.tableView.isHidden = true
        } else {
            self.tableView.isHidden = false
        }
        
        self.getAllNotifications()

      
    }
    
    @IBAction func refresh(_ sender: UIButton) {
        self.getAllNotifications()
    }
    
    
    
    
    
    
    
    
    
  
}



