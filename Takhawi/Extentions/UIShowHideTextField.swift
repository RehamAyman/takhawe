//
//  UIShowHideTextField.swift
//  Takhawi
//
//  Created by Sara Mady on 24/07/2023.
//

import Foundation
import UIKit

class UIShowHideTextField: UITextField {

    let rightButton  = UIButton(type: .custom)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()

    }

    func commonInit() {
        rightButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        layer.cornerRadius = layer.frame.height / 2
        layer.shadowRadius = 5

        if Language.isRTL() {
            print("Right")
            self.setRightPaddingPoints(10)
            self.leftView = rightButton
            self.leftViewMode = .always

        } else {
            print("Left")
            self.setLeftPaddingPoints(10)
            self.rightView = rightButton
            self.rightViewMode = .always
        }

        isSecureTextEntry = true
    }

    @objc
    func toggleShowHide(button: UIButton) {
        toggle()
    }

    func toggle() {
        isSecureTextEntry = !isSecureTextEntry
        if isSecureTextEntry {
            rightButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            rightButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }

}
