//
//  hotelsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class hotelsVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    
//MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.topView.addBottomCornersView(num: 30)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: hotelCell.self)
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
    @IBAction func filterAction(_ sender: UIButton) {
    
            let vc = filterViewVC()
            vc.dismissAction = { id in
                self.removePresentEffect()
            }
            self.presentWithEffect(vc: vc)
        }
       

}


//MARK: - Networking -
extension hotelsVC {
    
}

//MARK: - Routes -
extension hotelsVC {
    
}
