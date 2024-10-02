//
//  messagesViewVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class messagesViewVC: BaseVC {
    
    //MARK: - IBOutlets -
    @IBOutlet weak var emptyView: UIView!
    
    
    //MARK: - Properties -
    
    
  
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getAllMessages()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    
    //MARK: - Logic Methods -
    
    
    //MARK: - Actions -
    
    @IBAction func gotoHome(_ sender: UIButton) {
        self.pop(animated: true )
    }
}


//MARK: - Networking -
extension messagesViewVC {
    
}

//MARK: - Routes -
extension messagesViewVC {
    func getAllMessages () {
        
    }
    
}
