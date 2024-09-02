//
//  openCalendarVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/02/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class openCalendarVC: BaseVC {
    
    
//MARK: - IBOutlets -
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var mydatePicker: UIDatePicker!
    
//MARK: - Properties -
    var action: ((Date) -> Void)?
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        if let subviews = mydatePicker.subviews as? [UIView] {
            for view in subviews {
                // You might need to adjust this code based on the specific view hierarchy
                if let label = view as? UILabel {
                    label.font = UIFont(name: "HelveticaNeue", size: 15) // Replace with your font
                }
            }
        }
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.AddTOPCornersView(num: 20)
        
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    @IBAction func selectAction(_ sender: UIButton) {
        self.action?(self.mydatePicker.date)
        self.dismiss(animated: true )
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true )
    }
}


//MARK: - Networking -
extension openCalendarVC {
    
}

//MARK: - Routes -
extension openCalendarVC {
    
}
