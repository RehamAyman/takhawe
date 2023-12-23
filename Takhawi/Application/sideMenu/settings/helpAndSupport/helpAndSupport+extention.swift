//
//  helpAndSupport+extention.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//

import UIKit


extension helpAndSupportVC : UITextViewDelegate   {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.systemGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write your complain here (minimum 10 characters)"
            textView.textColor = UIColor.systemGray
        }
    }
}
