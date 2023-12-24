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
        let screenSize: CGRect = UIScreen.main.bounds
        
        swiftUIView.view.backgroundColor = UIColor.clear
        
        swiftUIView.view.centerInSuperview(size: CGSize(width: screenSize.width , height: 250 ))
       
        swiftUIView.view.tag = 909
        cardeView.addSubview(swiftUIView.view)
        
        swiftUIView.didMove(toParent: self)
        
      
        
       
        
       

        
    }
    
    
    
    //MARK: - actions
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        if let viewWithTag = self.view.viewWithTag(909) {
            viewWithTag.removeFromSuperview()
        }
        self.pop(animated: true )
        
    }
    
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
