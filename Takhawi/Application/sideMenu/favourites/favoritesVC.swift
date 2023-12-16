//
//  favoritesVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class favoritesVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var segment: UISegmentedControl!
    
//MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
             segment.setTitleTextAttributes(titleTextAttributes, for:.normal)

        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segment.setTitleTextAttributes(titleTextAttributes1 as [NSAttributedString.Key : Any], for:.selected)
        
        segment.selectedSegmentTintColor = UIColor(named: "MainColor")
        segment.backgroundColor = UIColor(named: "secFavSeg")
        
       
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension favoritesVC {
    
}

//MARK: - Routes -
extension favoritesVC {
    
}
