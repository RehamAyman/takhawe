//
//  nafathSecScreenVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 20/08/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class nafathSecScreenVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
    @IBOutlet weak var nafathLogo: UIImageView!
    @IBOutlet weak var sheildView: UIView!
    //MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.sheildView.layer.addBasicShadow(cornerRadius: 15)
        nafathLogo.addTapGesture {
            self.showSuccessPop()
        }
        
        sheildView.addTapGesture {
            self.showFailerPop()
        }
        
    }
    
//MARK: - Logic Methods -هذا الجزء مخصص لربط مع نفاذ
    
    //MARK:- FIRE THIS CODE IN SUCCESS
    
    private func showSuccessPop () {
        showPopTopAlert(title: "Done".localize , withMessage: "Your account has been successfully verified.".localize , success: true )
    }
    
    
    //MARK:- FIRE THIS CODE IN FAILER
    private func showFailerPop () {
        showPopTopAlert(title: "Error!".localize , withMessage: "Authentication failed".localize , success: false  )
    }
    
    private func convertToHijri(from gregorianDate: Date) -> String {
        let hijriCalendar = Calendar(identifier: .islamicUmmAlQura)
        let formatter = DateFormatter()
        formatter.calendar = hijriCalendar
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "ar") // Arabic format
        return formatter.string(from: gregorianDate)
    }
    // Example Usage
    private func HowToUse () {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let birthDate = dateFormatter.date(from: "1995-08-15") { // Example birthdate
            let hijriDate = convertToHijri(from: birthDate)
            print("Hijri Date: \(hijriDate)") // Output: 18 ربيع الأول 1416 هـ (example)
        }
    }
        
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension nafathSecScreenVC {
    
}

//MARK: - Routes -
extension nafathSecScreenVC {
    
}
