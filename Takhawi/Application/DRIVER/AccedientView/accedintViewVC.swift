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
    
    @IBOutlet weak var mainView: UIView!
    
    
//MARK: - Properties -
    

    
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
    }
    
//MARK: - Logic Methods -
    private func handleViewsAction () {
        for i in self.allViewsOutlet {
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
    
}


//MARK: - Networking -
extension accedintViewVC {
    
}

//MARK: - Routes -
extension accedintViewVC {
    
}
