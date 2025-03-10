//
//  extensionUITextField.swift
//  Masar Ebdaa
//
//  Created by abdullah tarek on 19/09/2021.
//

import UIKit

extension UITextField {
    func setPlaceHolder(withString string: String, Color color: UIColor) {
        attributedPlaceholder = NSAttributedString(string: string, attributes: [NSAttributedString.Key.foregroundColor: color])
    }

    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }

    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        rightView = paddingView
    }
}

class MainAppTextFaild: UITextField {

    required init(title: String) {
        super.init(frame: .zero)
        self.setLeftPaddingPoints(10)
        self.setRightPaddingPoints(10)

        layer.cornerRadius = layer.frame.height / 2
        layer.shadowRadius = 5
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setLeftPaddingPoints(10)
        self.setRightPaddingPoints(10)
        layer.cornerRadius = layer.frame.height / 2
        layer.shadowRadius = 5
    }
}

// @IBDesignable
// class CustomTextField: UITextField {
//    @IBInspectable var leftImage: UIImage? {
//        didSet {
//            updateView()
//        }
//    }
//
//    @IBInspectable var leftPadding: CGFloat = 0 {
//        didSet {
//            updateView()
//        }
//    }
//
//    @IBInspectable var rightImage: UIImage? {
//        didSet {
//            updateView()
//        }
//    }
//
//    @IBInspectable var rightPadding: CGFloat = 0 {
//        didSet {
//            updateView()
//        }
//    }
//
//    private var _isRightViewVisible: Bool = true
//    var isRightViewVisible: Bool {
//        get {
//            return _isRightViewVisible
//        }
//        set {
//            _isRightViewVisible = newValue
//            updateView()
//        }
//    }
//
//    func updateView() {
//        setLeftImage()
//        setRightImage()
//
//        // Placeholder text color
//        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor: tintColor])
//    }
//
//    func setLeftImage() {
//        leftViewMode = UITextField.ViewMode.always
//        var view: UIView
//
//        if let image = leftImage {
//            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
//            imageView.image = image
//            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
//            imageView.tintColor = tintColor
//
//            var width = imageView.frame.width + leftPadding
//
//            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
//                width += 5
//            }
//
//            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
//            view.addSubview(imageView)
//        } else {
//            view = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: 20))
//        }
//
//        leftView = view
//    }
//
//    func setRightImage() {
//        rightViewMode = UITextField.ViewMode.always
//
//        var view: UIView
//
//        if let image = rightImage, isRightViewVisible {
//            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//            imageView.image = image
//            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
//            imageView.tintColor = tintColor
//
//            var width = imageView.frame.width + rightPadding
//
//            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
//                width += 5
//            }
//
//            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
//            view.addSubview(imageView)
//
//        } else {
//            view = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: 20))
//        }
//
//        rightView = view
//    }
//
//    @IBInspectable public var borderColor: UIColor = UIColor.clear {
//        didSet {
//            layer.borderColor = borderColor.cgColor
//        }
//    }
//
//    @IBInspectable public var borderWidth: CGFloat = 0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//
//    @IBInspectable public var cornerRadius: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//        }
//    }
//
//    @IBInspectable public var bottomBorder: CGFloat = 0 {
//        didSet {
//            borderStyle = .none
//            layer.backgroundColor = UIColor.white.cgColor
//
//            layer.masksToBounds = false
//            //   layer.shadowColor = UIColor.gray.cgColor
//            layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//            layer.shadowOpacity = 1.0
//            layer.shadowRadius = 0.0
//        }
//    }
//
//    @IBInspectable public var bottomBorderColor: UIColor = UIColor.clear {
//        didSet {
//            layer.shadowColor = bottomBorderColor.cgColor
//            layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//            layer.shadowOpacity = 1.0
//            layer.shadowRadius = 0.0
//        }
//    }
//
//    /// Sets the placeholder color
//    @IBInspectable var placeHolderColor: UIColor? {
//        get {
//            return self.placeHolderColor
//        }
//        set {
//            attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor: newValue!])
//        }
//    }
// }
