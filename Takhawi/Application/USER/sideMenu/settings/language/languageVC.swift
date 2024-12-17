//
//  languageVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class languageVC: BaseVC {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var englishContainerView: UIView!
    
    @IBOutlet weak var arabicCheckIcon: UIImageView!
    @IBOutlet weak var englishCheckIcon: UIImageView!
    @IBOutlet weak var arabicContainerView: UIView!
    //MARK: - Properties -
    

    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.DetectTheLang()
        self.arabicContainerView.addTapGesture {
            UIView.animate(withDuration: 0.5) {
                self.changeToAr()
            }
        }
        
        self.englishContainerView.addTapGesture {
            UIView.animate(withDuration: 0.5) {
                self.changeToEn()
            }
        }
    }
    
    //MARK: - Logic Methods -
    
    func changeToAr () {
        self.arabicContainerView.borderColor = UIColor(named: colors.mainColor.rawValue)
        self.englishContainerView.backgroundColor = UIColor.systemGray4.withAlphaComponent(0.5 )
        self.arabicContainerView.backgroundColor = UIColor.white
        self.englishContainerView.borderWidth = 0
        self.arabicContainerView.borderWidth = 1.5
        self.arabicCheckIcon.image = UIImage(named: "checkbox")
        self.englishCheckIcon.image = UIImage(named: "UNcheckbox")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
            LocalizationManager.shared.setLanguage(language: .Arabic)
        }
       
  
        
    }
    
    
    func changeToEn () {
        self.englishCheckIcon.image = UIImage(named: "checkbox")
        self.englishContainerView.borderWidth = 1.5
        self.englishContainerView.borderColor = UIColor(named: "MainColor")
        self.arabicCheckIcon.image = UIImage(named: "UNcheckbox")
        self.arabicContainerView.borderWidth = 0
        self.arabicContainerView.backgroundColor = UIColor.systemGray4.withAlphaComponent(0.5 )
        self.englishContainerView.backgroundColor = UIColor.white
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
            LocalizationManager.shared.setLanguage(language: .English)
        }
        
    }
    
    
    
    func DetectTheLang () {
        if  LocalizationManager.shared.getLanguage() == .Arabic {
            self.arabicContainerView.borderColor = UIColor(named: "MainColor")
            self.englishContainerView.backgroundColor = UIColor.systemGray4.withAlphaComponent(0.5 )
            self.arabicContainerView.backgroundColor = UIColor.white
            self.englishContainerView.borderWidth = 0
            self.arabicContainerView.borderWidth = 1.5
            self.arabicCheckIcon.image = UIImage(named: "checkbox")
            self.englishCheckIcon.image = UIImage(named: "UNcheckbox")
            
        } else {
            self.englishCheckIcon.image = UIImage(named: "checkbox")
            self.englishContainerView.borderWidth = 1.5
            self.englishContainerView.borderColor = UIColor(named: "MainColor")
            self.arabicCheckIcon.image = UIImage(named: "UNcheckbox")
            self.arabicContainerView.borderWidth = 0
            self.arabicContainerView.backgroundColor = UIColor.systemGray4.withAlphaComponent(0.5 )
            self.englishContainerView.backgroundColor = UIColor.white
            
        }
        
    }
    //MARK: - Actions -
    
}


//MARK: - Networking -
extension languageVC {
    
}

//MARK: - Routes -
extension languageVC {
    
}
