//
//  successBookViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class successBookViewVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var confirmOutlet: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    
//MARK: - Properties -
    var action: (() -> Void)?
    var drivername : String = ""
//MARK: - Creation -
    
   
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.layer.addBasicShadow(cornerRadius: 35 )
        self.driverName.text = self.drivername
 
        
    }
    
//MARK: - Logic Methods -
    
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
   {
       let touch = touches.first
       if touch?.view != self.mainView
       { self.dismiss(animated: true, completion: nil) }
   }
    
    
    private func openingAnimation () {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)  { [weak self] in
        self?.visualView.isHidden = false
            
            UIView.animate(withDuration: 0.5) {
                self?.checkMark.layer.transform = CATransform3DMakeScale( 1.3 , 1.3 , 1)
            } completion: { completed  in
                if completed {
                    UIView.animate(withDuration: 0.5) {
                        self?.checkMark.layer.transform = CATransform3DMakeScale(1, 1, 1)
                        // do here any actionn after animation done !
                        
                        
                    }
                }
            }
       }
    }
    
    
//MARK: - Actions -
    
    @IBAction func confirmAction(_ sender: UIButton) {
        self.dismiss(animated: true )
        self.action?()
    
    }
    
    
    
    
    @IBAction func dismissAction(_ sender: UIButton) {
   
            self.visualView.isHidden = true
            self.dismiss(animated: true )
            AppHelper.changeWindowRoot(vc: homeVC())
      
    }
    
    
    
    
    
}


//MARK: - Networking -
extension successBookViewVC {
    
}

//MARK: - Routes -
extension successBookViewVC {
    
}
