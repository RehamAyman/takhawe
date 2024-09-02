//
//  hotelDetailsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 07/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import ImageSlideshow
import GoogleMaps

class hotelDetailsVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var checkAvaliablityOutlet: UIView!
    @IBOutlet weak var showLocationOutlet: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var outterView: UIView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var imageSliderView: ImageSlideshow!
    
    @IBOutlet weak var bottomView: UIView!
    
    //MARK: - Properties -
    let dummydate : [dummyActivity] = [
        dummyActivity(icon: "Vector 3", name: "Free Wifi" , id: 2 ) ,
        dummyActivity(icon: "AC", name: "Air Condition" , id: 2 ) ,
        dummyActivity(icon: "Group 8", name: "No Smoking" , id: 2 ) ,
        dummyActivity(icon: "Food", name: "Breakfast" , id: 2)
        
    ]
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.setUpGoogleView()
        self.innerView.layer.cornerRadius = 20
        scrollView.contentInsetAdjustmentBehavior = .never
        self.configImageSlider()
        collectionView.register(cellType: amenitiesCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        showLocationOutlet.underLine()
        bottomView.layer.addBasicTopShadow(cornerRadius: 20)
        checkAvaliablityOutlet.addTapGesture {
            print("hello ")
        }
        
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
