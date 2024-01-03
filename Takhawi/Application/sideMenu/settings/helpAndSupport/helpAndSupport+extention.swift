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
            textView.text = "Write your complain here (minimum 10 characters)".localize
            textView.textColor = UIColor.systemGray
        }
    }
    
    func validateAndSend () {
        
        if self.complain {
            if self.complaintextField.text == "" {
                showPopTopAlert(title: "Add complaint reason".localize, withMessage: "please select a complaint reason from the list first!".localize, success: false )
             
                
            } else {
                let vc = baseSuccessAlertVC()
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: true)
            }
        } else {
            if self.complainTextView.text == "Write your complain here (minimum 10 characters)".localize {
                showPopTopAlert(title: "Missing field!".localize, withMessage: "please write any note before send".localize, success: false )
               
            } else {
                let vc = baseSuccessAlertVC()
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: true)
            }
        }
        
    }
}
