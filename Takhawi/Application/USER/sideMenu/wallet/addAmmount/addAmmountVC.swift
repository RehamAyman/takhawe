//
//  addAmmountVC.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit
import MaterialComponents
import SwiftUI


//import CollectionViewPagingLayout

class addAmountVC : BaseVC  {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var backOutlet: UIButton!
    @IBOutlet weak var addAmountTextField: MDCOutlinedTextField!
   
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties -
 
    var myCards : [cardResult] = []
    
    // MARK: - Lifecycle -
        override func viewDidLoad() {
            super.viewDidLoad()
            self.configureInitialDesign()
            
            
        }
        
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.addAmountTextField.handelMAINTextField(placeHolder: "Enter Amount".localize)
        self.addAmountTextField.label.text = "Enter Amount".localize
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: cardsCell.self )
       
        self.getAllSavedCards()
    }
    
    
    
    //MARK: - actions
    
    
    
    @IBAction func addNewCard(_ sender: UIButton) {
        let vc = paymentWebView()
        vc.action = {
            self.getAllSavedCards()
        }
        self.present( vc , animated: true )
        
    }
    
    
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
      
        self.pop(animated: true )
        
    }
    
    
    
    private func getAllSavedCards () {
        activityIndicatorr.startAnimating()
        UserRouter.getAllPaymentCards.send {  [weak self ] (response : APIGenericResponse<[cardResult]> ) in
            guard let self = self else { return }
            self.myCards = response.result ?? []
            self.tableView.reloadData()
            
        }
    }
    
    
}



//
