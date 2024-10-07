//
//  additionalChatClass.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/03/1446 AH.
//

import UIKit

public protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

extension UILabel: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}


extension UITableView {
    func setPlaceholder(isEmpty: Bool, separator: UITableViewCell.SeparatorStyle = .none) {
        if isEmpty {
            self.createPlaceholder(.empty)
        } else {
            self.restorePlaceholderWith(seperator: separator)
        }
    }
}




extension UITextView {
    var textValue: String? {
        guard let word = text?.trimWhiteSpace(), !word.isEmpty else {
            return nil
        }
        return word
    }
}



class TextViewContentSized: UITextView {
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }

}

class ChatTextViewContentSized: UITextView {
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        let height = contentSize.height < 100 ? contentSize.height : 100
        return CGSize(width: UIView.noIntrinsicMetric, height: height)
    }

}

class CustomNavigationView: UIView {
    var titleLabel = UILabel()
    var backButton = UIButton()
    let stackView = UIStackView()


    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.white
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 5.0, height: 0)
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
        titleLabel.textColor = UIColor.black
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.addArrangedSubview(titleLabel)
        stackView.axis = .horizontal
        stackView.spacing = 10
        self.addSubview(stackView)
       
        if isCenter {
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: 15).isActive = true
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }else{
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: 15).isActive = true
            if LocalizationManager.shared.getLanguage() == .Arabic {
                stackView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -15).isActive = true
            }else{
                stackView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20).isActive = true
            }
        }
    }
    
    @IBInspectable
    var title: String = "" {
        didSet {
            titleLabel.text = title.localized
        }
    }
    
    @IBInspectable
    var showBackButton: Bool = false {
        didSet {
            if showBackButton && isCenter == false{
                backButton.translatesAutoresizingMaskIntoConstraints = false
                backButton.setTitle(nil, for: .normal)
                backButton.isUserInteractionEnabled = false
                backButton.setImage(UIImage(named: "Group 25"), for: .normal)
                
                if LocalizationManager.shared.getLanguage() == .English  {
                    backButton.flipX()
                }
                stackView.addTapGesture {
                    self.action()
                }
                stackView.addArrangedSubview(backButton)
            }
        }
    }
    
    @IBInspectable
    var isCenter: Bool = false {
        didSet {
            if isCenter {
                self.titleLabel.textAlignment = .center

            }else{
                self.titleLabel.textAlignment = .natural
                stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
                stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 15).isActive = true

            }
        }
    }
     func action() {
         print("actionnnn")
        if self.parentViewController != nil {
            self.parentViewController?.navigationController?.popViewController(animated: true)
        }
    }
    
}

extension UIViewController{
    public func delay(bySeconds seconds: Double, dispatchLevel: DispatchLevel = .main, closure: @escaping () -> Void) {
        let dispatchTime = DispatchTime.now() + seconds
        dispatchLevel.dispatchQueue.asyncAfter(deadline: dispatchTime, execute: closure)
    }
    
    public enum DispatchLevel {
        case main, userInteractive, userInitiated, utility, background
        var dispatchQueue: DispatchQueue {
            switch self {
            case .main:                 return DispatchQueue.main
            case .userInteractive:       return DispatchQueue.global(qos: .userInteractive)
            case .userInitiated:         return DispatchQueue.global(qos: .userInitiated)
            case .utility:              return DispatchQueue.global(qos: .utility)
            case .background:           return DispatchQueue.global(qos: .background)
            }
        }
    }
}



struct MessageData: Codable {
    let id: String?
   // let isSender:Int
    let body: String?
    let type: String?
    let duration, name: String?
    let createdDt: String?
    let senderId : Int?
    let is_read : Bool?
    let chatId : String
    
    
    enum CodingKeys: String, CodingKey {
        case id
      //  case isSender = "is_sender"
        case body = "content"
        case type = "contentType"
        case duration, name
        case createdDt = "createdAt"
        case senderId = "senderId"
        case is_read = "is_read"
        case chatId
        
    }
}


