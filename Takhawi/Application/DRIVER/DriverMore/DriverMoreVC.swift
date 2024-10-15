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
        self.getProfileData()
        self.handleVCActions()
    }
    

    
    
   
    
    
    private func getProfileData () {
        if let user = UserDefaults.user?.user {
            self.userEmail.text = user.email
            self.userName.text = user.name
            if let avatar = user.avatar {
                let url = Server.imageBase.rawValue + avatar
                self.userImage.setImage(image: url )
            }
        }
    }
    
    

    
    @IBAction func logoutAction(_ sender: UIButton) {
        let vc =    logoutpopVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true )
        
    }
    
    
    
    
}
