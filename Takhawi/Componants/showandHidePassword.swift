//
//  showandHidePassword.swift
//  WritingService
//
//  Created by Sara Mady on 13/03/2023.
//

import Foundation
import UIKit
extension UIViewController {
     func createShowPasswordButton(action: Selector) -> UIButton {
            let showPasswordButton = UIButton()
        showPasswordButton.setImage(UIImage(named: "hidepass"), for: .normal)
        showPasswordButton.setImage(UIImage(named: "showpass"), for: .selected)
            showPasswordButton.addTarget(self, action: action, for: .touchUpInside)
            return showPasswordButton
        }
         func add(secureButton: UIButton, for textField: UITextField) {
            if LocalizationManager.shared.getLanguage() == .Arabic  {
                print("Righttttt")
                textField.rightView = secureButton
                textField.rightViewMode = .always
            } else {
                print("Lefft")
                textField.leftView = secureButton
                textField.leftViewMode = .always
            }
        }

}
