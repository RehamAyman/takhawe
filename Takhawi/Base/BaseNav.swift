//
//  BaseNav.swift
//  WritingService
//
//  Created by Sara Mady on 14/03/2023.
//

import Foundation
import UIKit

class BaseNav: UINavigationController {

    // MARK: - Properities -
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGester()
        self.handelAppearance()

    }

    // MARK: - Design -
    private func handelAppearance() {
        self.navigationBar.isHidden = true
//        appearance.backgroundColor = .white
    }
    private func setupGester() {
        interactivePopGestureRecognizer?.delegate = self
        self.view.semanticContentAttribute = Language.isRTL() ? .forceRightToLeft : .forceLeftToRight
    }

}
