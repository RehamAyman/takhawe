//
//  helpAndSupport+extention.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//

import UIKit
import AlertKit


extension helpAndSupportVC : UITextViewDelegate   {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.systemGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write your complain here".localize
            textView.textColor = UIColor.systemGray
        }
    }
    
    func validateAndSend () {
        
        if self.complain {
            if self.complaintextField.text == "" {
                showPopTopAlert(title: "Add complaint reason".localize, withMessage: "please select a complaint reason from the list first!".localize, success: false )
                
            } else if self.complainTextView.text == "Write your complain here".localize {
                showPopTopAlert(title: "Missing field!".localize, withMessage: "please write any note before send".localize, success: false )
                
            } else {
                
               
                self.sendAcomplain()
                
              
            }
        } else {
            if self.complainTextView.text == "Write your complain here".localize {
                showPopTopAlert(title: "Missing field!".localize, withMessage: "please write any note before send".localize, success: false )
               
            } else {
                //
                self.sendAcomplain()
            }
        }
        
    }
    
    private func sendAcomplain () {
        activityIndicatorr.startAnimating()
        UserRouter.complain(category: self.selectedReson , note: self.complainTextView.text , isComplain: self.complain).send { [weak self] (response: APIGlobalResponse ) in
            guard let self = self else { return }
            
            if response.status == true {
                let vc = baseSuccessAlertVC()
                vc.mainTitleText = "Sent Successfully".localize
                vc.subTitleText = "Your Complain has been sent successfully".localize
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: true)
            }
            
        }
    }
    
}
