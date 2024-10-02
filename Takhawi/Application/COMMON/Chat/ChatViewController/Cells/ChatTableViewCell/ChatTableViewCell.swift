import UIKit

class ChatTableViewCell: UITableViewCell {

    //MARK: - IBOutlets -
    @IBOutlet weak private var leadingSpacingView: UIView!
    @IBOutlet weak private var trillingSpacingView: UIView!
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet weak private var senderImageView: UIImageView!
    @IBOutlet weak private var senderImageViewContainer: UIView!
    @IBOutlet weak private var leadingResizeSpacingView: UIView!
    @IBOutlet weak private var trillingResizeSpacingView: UIView!
    
    
    var link = ""
    
    //MARK: - Lifecycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupInitialDesign()
    }
    
    //MARK: - Design -
    private func setupInitialDesign() {
        self.selectionStyle = .none
        self.containerView.layer.cornerRadius = 20
    }
    
    //MARK: - Data -
    func set(message: String?, isMyMessage: Bool, senderImage: String?) {
        self.leadingSpacingView.isHidden = isMyMessage
        self.trillingSpacingView.isHidden = !isMyMessage
        self.senderImageViewContainer.isHidden = isMyMessage
        
        self.containerView.backgroundColor = isMyMessage ? UIColor(hexString: "5B5E71").withAlphaComponent(0.2) : .white
        self.messageLabel.textColor = isMyMessage ? .darkGray : .darkGray
        
        self.messageLabel.text = message
        self.senderImageView.setImage(image:  senderImage ?? "" )
        self.leadingResizeSpacingView.isHidden = isMyMessage
        self.trillingResizeSpacingView.isHidden = !isMyMessage
        
        if isMyMessage {
            if LocalizationManager.shared.getLanguage() == .Arabic  {
                self.containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
            } else {
                self.containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            }
        } else {
            if LocalizationManager.shared.getLanguage() == .Arabic  {
                self.containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            } else {
                self.containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
            }
        }
        
        
        if message?.contains("http") == true{
            let attributedString = NSMutableAttributedString(string: message ?? "")
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 0, length: attributedString.length))

            self.link = message ?? ""
            self.messageLabel.isUserInteractionEnabled = true
            self.messageLabel.textColor = .link
            self.messageLabel.attributedText = attributedString
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
            self.messageLabel.addGestureRecognizer(tapGesture)

        }
        
        
        
    }
    
    @objc func labelTapped(_ gesture: UITapGestureRecognizer) {
        if let url = URL(string: self.link) {
            UIApplication.shared.open(url)
        }
    }
    
}
