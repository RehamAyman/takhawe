//
//  FiristStrpProgressCell.swift
//  Marsol Awamer
//
//  Created by abdullah tarek on 02/01/2022.
//

import UIKit

class FiristStrpProgressCell: UICollectionViewCell {

    @IBOutlet weak var progressImage: UIImageView!
    @IBOutlet weak var progressTitle: UILabel!
    @IBOutlet weak var leftLine: UIView!
    @IBOutlet weak var rightLine: UIView!

    var isFinishState = false
    var progressColor = "#FFB72B"

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configeCell (title: String, currenIndex: Int, lastIndex: Int, selectedIndex: Int) {
        if selectedIndex == -1 {
            lastStats(title: title)
        } else {
            if currenIndex < selectedIndex {
                lastStats(title: title)
            } else if currenIndex == selectedIndex {
                currentState(title: title)
            } else if currenIndex > selectedIndex {
                nextState(title: title)
            }
        }

        if currenIndex == 0 {
            leftLine.removeDashLine()
        } else if lastIndex - 1 == currenIndex {
            rightLine.removeDashLine()
        }
    }

    func lastStats(title: String) {
        leftLine.createDashedLine(color: AppColors.shared.mainColor)
        rightLine.createDashedLine(color: AppColors.shared.mainColor)
        progressTitle.text = title
        progressTitle.textColor =  AppColors.shared.mainDarkFontColor
        progressImage.image = UIImage(named: "state-3")
        progressImage.layer.shadowRadius = 1
        progressImage.layer.shadowOpacity = 0.5
        progressImage.layer.shadowOffset = CGSize(width: 0, height: 3)
        progressImage.layer.shadowColor = AppColors.shared.mainColor.cgColor.copy(alpha: 0.5)
    }

    func currentState(title: String) {
        leftLine.createDashedLine(color: AppColors.shared.mainColor)
        rightLine.createDashedLine(color: .lightGray)
        progressTitle.text = title
        progressTitle.textColor = AppColors.shared.mainDarkFontColor
        progressImage.image = UIImage(named: "state-2")

        progressImage.layer.shadowRadius = 0.5
        progressImage.layer.shadowOpacity = 0.3
        progressImage.layer.shadowOffset = CGSize(width: 0, height: 2)
        progressImage.layer.shadowColor = UIColor.black.withAlphaComponent(0.20).cgColor
    }

    func nextState(title: String) {
        leftLine.createDashedLine(color: .lightGray)
        rightLine.createDashedLine(color: .lightGray)
        progressTitle.text = title
        progressTitle.textColor = AppColors.shared.mainColor
        progressImage.image = UIImage(named: "state-1")
    }
}
