//
//  Extention+Material.swift
//  Masar Ebdaa
//
//  Created by abdullah tarek on 09/10/2021.
//

import Foundation
import UIKit
import M13Checkbox

func RestartToHome() {
    guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }

    var sb = UIStoryboard()

}

@IBDesignable
class M13CheckboxView: M13Checkbox {}
