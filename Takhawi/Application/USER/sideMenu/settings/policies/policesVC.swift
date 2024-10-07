//
//  policesVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class policesVC: BaseVC {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var textView: UITextView!
    
    //MARK: - Properties -
    
    
  
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getPolices()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    
    //MARK: - Logic Methods -
    
    
    //MARK: - Actions -
    
}


//MARK: - Networking -
extension policesVC {
    func getPolices () {
        activityIndicatorr.startAnimating()
        UserRouter.getPolices.send { [weak self ] (response : APIGenericResponse<polices> ) in
            guard let self = self else { return }
            if let res = response.result {
                self.textView.text = res.content ?? "" 
                
            }
        }
    }
}

//MARK: - Routes -
extension policesVC {
    
}
