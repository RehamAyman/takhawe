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
    
    @IBOutlet weak var totalAmmount: UILabel!
    
    //MARK: - Properties -
    
    var walletTransactions : [WalletResult] = []
    
    // MARK: - Lifecycle -
        override func viewDidLoad() {
            super.viewDidLoad()
            self.configureInitialDesign()
            self.getUserAmmount()
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
        vc.action = {
            self.getUserAmmount()
        }
        push(vc)
        
        
    }
    
    
    
   
    
    
    
}

