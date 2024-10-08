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
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties -
    
    var chats : [ChatDataModelResult] = []
  
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getAllMessages()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        tableView.delegate = self
        tableView.dataSource = self 
        self.tableView.register(cellType: messagesCell.self)
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
        activityIndicatorr.startAnimating()
        UserRouter.getAllChats.send { [weak self ] ( response : APIGenericResponse<[ChatDataModelResult]>  )  in
            
            
            
            guard let self = self else { return }
            if let result = response.result {
                
                
                self.chats = result
                self.tableView.reloadData()
            }
            
        }
    }
    
}
