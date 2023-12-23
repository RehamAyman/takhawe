//
//  helpAndSupportVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import MaterialComponents

class helpAndSupportVC: BaseVC {
    
    //MARK: - IBOutlets -
    @IBOutlet weak var complaintextField: MDCOutlinedTextField!
    @IBOutlet weak var checkBoxIcon: UIImageView!
    
    @IBOutlet weak var complainTextView: UITextView!
    @IBOutlet weak var chooseComplainHeight: NSLayoutConstraint!
    @IBOutlet weak var chooseComplain: UIView!
    @IBOutlet weak var complanView: UIView!
   
    //MARK: - Properties -
    var  complain : Bool = false

    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.complaintextField.handelTextField(placeHolder: "Choose Your Complain")
        self.complaintextField.label.text = "Your Complain"
        self.complainTextView.delegate = self
        self.complainTextView.text = "Write your complain here (minimum 10 characters)"
        self.complainTextView.textColor = UIColor.systemGray
        self.complainTextView.contentInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        self.chooseComplain.isHidden = true
        self.chooseComplainHeight.constant = 0
        
        self.complanView.addTapGesture {
            self.complain = self.complain ? false : true
            self.checkBoxIcon.image = self.complain ? UIImage(named: "checkbox") : UIImage(named: "UNcheckbox")
            if self.complain {
               
                UIView.animate(withDuration: 0.5) {
                    self.chooseComplain.isHidden = false
                    self.chooseComplainHeight.constant = 50
                    self.view.layoutIfNeeded()
                }
            } else {
                self.chooseComplain.isHidden = true
                self.chooseComplainHeight.constant = 0
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }
        }
        self.chooseComplain.addTapGesture {

       let vc = selectComplainVC()
            vc.passComplainTitle = { text in
                self.complaintextField.text = text
                self.removePresentEffect()
            }
            vc.viewDismissed = {
                self.removePresentEffect()
            }
            self.presentWithEffect(vc:  vc )

        }
    }
    
    //MARK: - Logic Methods -
    
    
    //MARK: - Actions -
    
}


//MARK: - Networking -
extension helpAndSupportVC {
    
}

//MARK: - Routes -
extension helpAndSupportVC {
    
}

