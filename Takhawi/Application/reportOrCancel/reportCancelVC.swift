//
//  reportCancelVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 14/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import MaterialComponents

class reportCancelVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var subTitleHint: UILabel!
    @IBOutlet weak var screenTitle: UILabel!
    
    @IBOutlet weak var noteText: MDCOutlinedTextArea!
    //MARK: - Properties -
    var report : Bool = false
    var items : [String] = []
    
//MARK: - Creation -
  
    
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
        tableView.register(cellType: reportOrCandelCell.self)
        self.setupMainView()
      
      
    }
    

    
    
//MARK: - Actions -
    
    @IBAction func submit(_ sender: UIButton) {
    }
}


//MARK: - Networking -
extension reportCancelVC {
    
}

//MARK: - Routes -
extension reportCancelVC {
    
}
