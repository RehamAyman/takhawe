//
//  reviewsViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class reviewsViewVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
//MARK: - Properties -
    let dummyreviews : [reviewsModel] = [
        reviewsModel(username: "asmaa mohamed", userPhoto: "1", review: 2 , comment: " he did not reach at time so i give him 2 , also he drive so fast 🤕 . ") ,
        reviewsModel(username: "alia waleed ahmed ", userPhoto: "2", review: 4, comment: " a  good driver i rate him 4 🩷 ") ,
    reviewsModel(username: "alaa el shekh", userPhoto: "3", review: 4, comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ") ,
    reviewsModel(username: "mona ahmed", userPhoto: "4", review: 3, comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ")
        
    ]
         
    
//MARK: - Creation -
  
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
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
    
}

//MARK: - Routes -
extension reviewsViewVC {
    
}
