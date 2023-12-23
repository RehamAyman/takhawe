//
//  tripsSideMenuVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class tripsSideMenuVC: BaseVC {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var segment: ColoredCustomUISegmentedControl!
    
    //MARK: - Properties -
    
    
    //MARK: - Creation -
  
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.setupsegment()
    }
    
    //MARK: - Logic Methods -
    
    
    //MARK: - Actions -
    
}


//MARK: - Networking -
extension tripsSideMenuVC {
    
}

//MARK: - Routes -
extension tripsSideMenuVC {
    
}
