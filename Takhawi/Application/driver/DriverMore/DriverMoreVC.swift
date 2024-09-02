//
//  DriverMoreVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/02/1446 AH.
//

import UIKit

class DriverMoreVC: UIViewController {

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
            self.userImage.setImage(image: user.avatar ?? "" )
        }
    }

}
