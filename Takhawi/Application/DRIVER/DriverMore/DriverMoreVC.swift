//
//  DriverMoreVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/02/1446 AH.
//

import UIKit

class DriverMoreVC: UIViewController {
    @IBOutlet weak var vipV: UIView!
    
    @IBOutlet weak var basicView: UIView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.getProfileData()
       
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
