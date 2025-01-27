//
//  reviewsViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class reviewsViewVC: BaseVC {
    
    var targetId : Int = 0
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
//MARK: - Properties -
    var allReviews : [ReviewsListResult] = []
         
    
//MARK: - Creation -
  
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getAllReviews()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        tableview.delegate = self
        tableview.dataSource = self 
        tableview.register(UINib(nibName:"reviewCell", bundle: nil), forCellReuseIdentifier: "reviewCell")
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension reviewsViewVC {
    
    
    func getAllReviews() {
        activityIndicatorr.startAnimating()
        UserRouter.getAllReviews(id: self.targetId).send { [weak self ] ( response  : APIGenericResponse<[ReviewsListResult]>) in
            guard let self = self else { return }
            if let res = response.result {
                self.allReviews = res
                self.tableview.reloadData()
            }
        }
    }
  
   
   
    
}

//MARK: - Routes -
extension reviewsViewVC {
    
}
