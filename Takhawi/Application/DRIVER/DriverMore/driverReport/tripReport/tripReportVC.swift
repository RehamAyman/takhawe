//
//  tripReportVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class tripReportVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var mainView: UIView!
    
//MARK: - Properties -
    
    
//MARK: - Creation -

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.layer.addBasicShadow(cornerRadius: 16)
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension tripReportVC {
    
}

//MARK: - Routes -
extension tripReportVC {
    
}
