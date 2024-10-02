//
//  DriverRegisterVC.swift
//  Takhawi
//
//  Created by Sara Mady on 06/08/2023.
//
//  Template by MGAbouarab®

import UIKit

// MARK: - ViewController
class DriverRegisterVC: BaseVC {

    // MARK: - IBOutlets -

    @IBOutlet weak var wifiButton: UIButton!
    @IBOutlet weak var smokeButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var muicButton: UIButton!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!

    // MARK: - Properties -
    private var items: [String] = []

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        mainStack.animateToTop()

    }
    override func viewDidAppear(_ animated: Bool) {
        self.progressView.setProgress(0.6, animated: true)

    }

    // MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }

    // MARK: - Logic Methods -

    // MARK: - Actions -

    @IBAction func selectFeatureAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.cheackButtonSelected(button: self.wifiButton)
        case 1:
            self.cheackButtonSelected(button: self.smokeButton)
        case 2:
            self.cheackButtonSelected(button: self.foodButton)
        case 3:
            self.cheackButtonSelected(button: self.acButton)
        case 4:
            self.cheackButtonSelected(button: self.muicButton)
        default:
            break
        }
    }
    func cheackButtonSelected(button: UIButton) {
        if button.tintColor == UIColor.appColor(.MainColor) {
            button.tintColor = UIColor.lightGray
        } else {
            button.tintColor =  UIColor.appColor(.MainColor)
        }
    }

    @IBAction func nextAction(_ sender: Any) {
        let vc = RegisterDriverPersonalInfoVC()
        push(vc)
    }

}

// MARK: - End Of CollectionView -

// MARK: - Networking -
extension DriverRegisterVC {

}

// MARK: - Routes -
extension DriverRegisterVC {

}
