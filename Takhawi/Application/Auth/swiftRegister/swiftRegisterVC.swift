//
//  swiftRegisterVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import SwiftUI

class swiftRegisterVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var parentView: UIView!
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
        
        
        let vc = UIHostingController(rootView: regChieldTapView())
        let swiftuiView = vc.view!
        swiftuiView.translatesAutoresizingMaskIntoConstraints = false
        addChild(vc)
        parentView.addSubview(swiftuiView)
        NSLayoutConstraint.activate([
                swiftuiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                swiftuiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        vc.didMove(toParent: self)
        
        
    
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


