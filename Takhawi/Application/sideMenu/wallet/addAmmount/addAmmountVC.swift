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
    
    @IBOutlet weak var addAmountTextField: MDCOutlinedTextField!
    @IBOutlet weak var cardeView: UIView!
    //MARK: - Properties -
    lazy var swiftUIView = UIHostingController(rootView: animatedCartSwiftuiView())

    
    
    // MARK: - Lifecycle -
        override func viewDidLoad() {
            super.viewDidLoad()
            self.configureInitialDesign()
            
            
        }
        
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.addAmountTextField.handelTextField(placeHolder: "Enter Amount")
        self.addAmountTextField.label.text = "Enter Amount"
  
        
        self.addChild(swiftUIView)
        swiftUIView.view.frame = cardeView.frame
        swiftUIView.view.backgroundColor = UIColor.clear
        swiftUIView.view.centerInSuperview(size: self.cardeView.frame.size)
        cardeView.addSubview(swiftUIView.view)
        swiftUIView.didMove(toParent: self)
        
        
        
       
       

        
    }
    
    
    
    //MARK: - actions
    
    
    
}



//
////MARK: - IBOutlets -
//
//
////MARK: - Properties -
//
//
//
//
//
//// MARK: - Lifecycle -
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.configureInitialDesign()
//    }
//    
////MARK: - Design Methods -
//private func configureInitialDesign() {
//}
