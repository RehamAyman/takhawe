//
//  walletVC.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit

class walletVC : BaseVC {
    
    //MARK: - IBOutlets -
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Properties -
    
    
    
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
        tableView.register(cellType: walletCell.self)
        
    }
    
    //MARK: - actions -
    
    @IBAction func addMonyAction(_ sender: UIButton) {
        let vc = addAmountVC()
        push(vc)
    }
    
    
}

