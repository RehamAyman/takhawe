//
//  favoritesVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class favoritesVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
//MARK: - Properties -
    let dummyLocationData : [dummyLocations] = [
        dummyLocations(location:  "home" , locationDetails: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ") ,
        dummyLocations(location: "Office", locationDetails: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ") ,
        dummyLocations(location: "Hospital", locationDetails: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ")
        
    ]
    let dummyDriversData : [NotificationData] = [
    NotificationData(icon:  "" , title: "alaa el shekh", subtitle: "4.3 (221 reviews)"   ) ,
    NotificationData(icon:  "" , title: "ali waleed elsayed ", subtitle: "4.3 (221 reviews)"   ) ,
    NotificationData(icon:  "" , title: "mohamed ali hussen ", subtitle: "4.3 (221 reviews)"   )  ,
    NotificationData(icon:  "" , title: "waleed ehab ahmed", subtitle: "4.3 (221 reviews)"   )  ,
    NotificationData(icon:  "" , title: "abdullah ahmed mohamed ", subtitle: "4.3 (221 reviews)"   )
    ]
    
    
    
    enum DispkayedTasks {
        case drivers
        case locations
    }
    var displayedTask = DispkayedTasks.locations
    


    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
             segment.setTitleTextAttributes(titleTextAttributes, for:.normal)
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segment.setTitleTextAttributes(titleTextAttributes1 as [NSAttributedString.Key : Any], for:.selected)
        segment.selectedSegmentTintColor = UIColor(named: "MainColor")
        segment.backgroundColor = UIColor(named: "secFavSeg")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: favlocationCell.self)
        tableView.register(cellType: favDriverCell.self)
        
       
    }
    

    
    
    
//MARK: - Actions -
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 : // locations
            self.displayedTask = .locations
            self.tableView.reloadData()
        case 1 : // drivers
            self.displayedTask = .drivers
            self.tableView.reloadData()
        default:
            break
        }
    }
}


//MARK: - Networking -
extension favoritesVC {
    
}

//MARK: - Routes -
extension favoritesVC {
    
}



