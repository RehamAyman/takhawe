//
//  RoundImage.swift
//  WritingService
//
//  Created by Sara Mady on 04/05/2023.
//

import Foundation
import UIKit

@IBDesignable
class RoundImage: UIImageView {

    @IBInspectable var cornerR: CGFloat = 0 {

        didSet {
            self.layer.cornerRadius = cornerR
        }
    }

    @IBInspectable var boarderR: CGFloat = 0 {

        didSet {
            self.layer.borderWidth = boarderR
        }
    }

    @IBInspectable var boarderCol: UIColor = UIColor.clear {

        didSet {
            self.layer.borderColor = boarderCol.cgColor
        }
    }

}
