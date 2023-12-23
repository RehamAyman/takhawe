//
//  settingsSideVCVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class settingsSideVC: BaseVC {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var logoutOutlet: UIButton!
    
    @IBOutlet var stackViews: [UIView]!
    //MARK: - Properties -
    
    

    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.logoutOutlet.imagePadding(spacing: 10)
        for v in stackViews {
            v.layer.addBasicShadow(cornerRadius: 12)
            
            switch v.tag {
            case 1 : // polices
                v.addTapGesture {
                    let vc = policesVC()
                    self.push(vc)
                }
               
            case 2 : // support
                v.addTapGesture {
                   let vc = helpAndSupportVC()
                    self.push(vc)
                }
            case 3 : // about us
                v.addTapGesture {
                    let vc = aboutUsVC()
                    self.push(vc)
                }
               
            case 4 : // language
            print("lang")
                v.addTapGesture {
                    let vc = languageVC()
                    self.push(vc)
                }
               
                
              
                
            default:
                break
            }
        }
        
        
        
    }
    
    //MARK: - Logic Methods -
    
   
    //MARK: - Actions -
    
}


//MARK: - Networking -
extension settingsSideVC {
    
}

//MARK: - Routes -
extension settingsSideVC {
    
}
