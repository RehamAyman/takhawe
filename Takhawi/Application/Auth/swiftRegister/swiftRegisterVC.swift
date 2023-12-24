//
//  swiftRegisterVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import SwiftUI
import CollectionViewPagingLayout


class swiftRegisterVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    @IBOutlet weak var dotsPageControl: UIPageControl!
    
//MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.configureInitialDesign()
    }
  
    
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        dotsPageControl.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 2 , y: 2 )
        }
        
        
        self.collectionview.delegate = self
        self.collectionview.dataSource = self 
        self.collectionview.register(cellType: firstAuthCell.self)
        self.collectionview.register(cellType: secauthCell.self)
        let layout = CollectionViewPagingLayout()
        collectionview.collectionViewLayout = layout
        collectionview.isPagingEnabled = true // enabling paging effect
        layout.numberOfVisibleItems = nil 
        
        
    
    }
  
    
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension swiftRegisterVC {
    
}

//MARK: - Routes -
extension swiftRegisterVC {
    
}



extension UIPageControl {
    func customPageControl(dotWidth: CGFloat) {
        for (pageIndex, dotView) in self.subviews.enumerated() {
            dotView.frame.size = CGSize.init(width: dotWidth, height: dotWidth)
        }
    }
}


