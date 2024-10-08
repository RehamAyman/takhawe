//
//  messagesCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/03/1446 AH.
//

import UIKit

class messagesCell: UITableViewCell {
    @IBOutlet weak var senderImage: UIImageView!
    
    @IBOutlet weak var unreadLabel: UILabel!
    @IBOutlet weak var unreadContainer: UIView!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var senderName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
}
