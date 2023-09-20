//
//  RegisterDriverPersonalInfoCell.swift
//  Takhawi
//
//  Created by Sara Mady on 06/08/2023.
//
//  Template by MGAbouarab®

import UIKit

class RegisterDriverPersonalInfoCell: UICollectionViewCell {

    // MARK: - IBOutlets -

    @IBOutlet weak var hobbisName: UILabel!
    @IBOutlet weak var hobbisImage: UIImageView!
    @IBOutlet weak var conrinerView: UIView!

    // MARK: - properties -

    // MARK: - Lifecycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupInitialDesign()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.resetCellData()
    }

    // MARK: - Design Methods -
    private func setupInitialDesign() {

    }
    private func resetCellData() {

    }

    // MARK: - Set Data Methods -
    func configureWith(data: hobbiesModel) {
        self.hobbisImage.image = data.image
        self.hobbisName.text = data.name

        if data.isSelected {
                self.conrinerView.backgroundColor = UIColor.appColor(.SelectionColor)?.withAlphaComponent(0.7)
        } else {
                self.conrinerView.backgroundColor = UIColor.white

        }
    }

}
