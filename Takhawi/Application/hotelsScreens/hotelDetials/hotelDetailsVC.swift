//
//  hotelDetailsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 07/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import ImageSlideshow

class hotelDetailsVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var outterView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    @IBOutlet weak var imageSliderView: ImageSlideshow!
    //MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.innerView.layer.cornerRadius = 20
        scrollView.contentInsetAdjustmentBehavior = .never
        self.configImageSlider()
       
        
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension hotelDetailsVC {
    
}

//MARK: - Routes -
extension hotelDetailsVC {
    
}
