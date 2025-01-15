//
//  DriverMoreVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/02/1446 AH.
//

import UIKit

class DriverMoreVC: BaseVC {
    @IBOutlet weak var vipV: UIView!
    
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var aboutUs: UIView!
    @IBOutlet weak var basicView: UIView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var reportView: UIView!
    @IBOutlet weak var earningsView: UIView!
    @IBOutlet weak var messages: UIView!
    @IBOutlet weak var personalInfo: UIView!
    @IBOutlet weak var helpAndSupport: UIView!
    @IBOutlet weak var polices: UIView!
    @IBOutlet weak var switchRole: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.handleVCActions()
        self.getProfile()
        NotificationCenter.default.addObserver(self, selector: #selector(handleCustomNotification(_:)), name: .updateHomeProfile, object: nil)
    }

  
    
    @IBAction func logoutAction(_ sender: UIButton) {
        let vc =    logoutpopVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true )
    }
    
    
    @objc func handleCustomNotification(_ notification: Notification) {
        
        
        UserRouter.getProfile.send { [weak self ]  ( response : APIGenericResponse<profileResult> ) in
            guard let self = self else { return }
            if let result = response.result {
                if let imageString = result.avatar {
                    let avatar = Server.imageBase.rawValue + imageString
                    self.userImage.setImage(image: avatar)
                }
              
               
            }
        }
        
        
        
        
    }
    
    private func getProfile () {
        UserRouter.getProfile.send { [weak self ]  ( response : APIGenericResponse<profileResult> ) in
            guard let self = self else { return }
            if let result = response.result {
                self.userEmail.text = result.email ?? ""
                self.userName.text =  result.name ?? ""
                
                if let imageString = result.avatar {
                    let avatar = Server.imageBase.rawValue + imageString
                    self.userImage.setImage(image: avatar)
                }
              
               
            }
        }
    }
    
    
}
