//
//  accedintViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class accedintViewVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet var allViewsOutlet: [UIView]!
    
    @IBOutlet weak var backView: UIVisualEffectView!
    @IBOutlet weak var mainView: UIView!
    
    
//MARK: - Properties -
    let passedLat : Double = 0.0
    let passedLng : Double = 0.0

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.addTopLeftCoreners(num: 20 )
        self.handleViewsAction()
        self.backView.addTapGesture {
            self.dismiss(animated: true )
        }
        
    }
    
//MARK: - Logic Methods -
    private func handleViewsAction () {
       
        for i in self.allViewsOutlet {
            
            self.handleSelectionAction(uiview: i)
            if i.tag == 0 { // radar
                
            }else if  i.tag ==  1 { // animals
                
            } else if i.tag == 2 { // accident
                
            } else if i.tag == 3 { // change direction
                
            } else if i.tag == 4 { // alert
                
            } else if i.tag == 5 { // hole
                
            } else if i.tag == 6 { // speed
                
            } else if i.tag == 7 { // works
                
            }
        }
    }
    
   
//MARK: - Actions -
    
   private func handleSelectionAction ( uiview : UIView) {
        uiview.addTapGesture {
            self.allViewsOutlet.forEach { view in
                view.backgroundColor = .clear
            }
            uiview.layer.cornerRadius = 10
            uiview.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6 )
        }
    }
    
}


//MARK: - Networking -
extension accedintViewVC {
    
}

//MARK: - Routes -
extension accedintViewVC {
    
}
