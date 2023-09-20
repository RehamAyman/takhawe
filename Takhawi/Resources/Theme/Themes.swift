//
//  Themes.swift
//  WritingService
//
//  Created by Sara Mady on 19/03/2023.
//

import Foundation
import UIKit

final class Themes {

    // MARK: - Enum -
    enum Style: String, Codable, CaseIterable {
        case light
        case dark
        case systemStyle
    }

    // MARK: - Initializer -
    private init() {}

    // MARK: - Static Properites -
    static let current: Themes = Themes()
    static let colors: AppColors = AppColors.shared
    static let constants: ViewConstants = ViewConstants.shared

    // MARK: - Properities -
    private let fontName = FontFamilyName.DINArabic.rawValue
    var style: Themes.Style {
        get {
            return UserDefaults.themeStyle
        }
        set {
            self.setTheme(style: newValue)
        }
    }

    // MARK: - Private Methods -
    private func setTheme(style: Themes.Style) {

        UserDefaults.themeStyle = style

        switch style {
        case .light:
            self.animateToStyle(.light)
        case .dark:
            self.animateToStyle(.dark)
        case .systemStyle:
            self.animateToStyle(.unspecified)
        }

    }
    private func animateToStyle(_ style: UIUserInterfaceStyle) {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let window = window else {return}
        UIView.animate(withDuration: Themes.constants.smallAnimationTime, delay: 0) {
            window.overrideUserInterfaceStyle = style
        }
    }

    // MARK: -
    func setupFont() {
        UILabel.appearance().substituteFontName = fontName
        UITextView.appearance().substituteFontName = fontName
        UITextField.appearance().substituteFontName = fontName
    }

}
