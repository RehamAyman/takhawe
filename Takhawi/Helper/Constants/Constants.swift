//
//  Constants.swift
//  WritingService
//
//  Created by Sara Mady on 19/03/2023.
//

import Foundation

final class ViewConstants {

    static let shared: ViewConstants = ViewConstants()

    private init() {}

    let smallCornerRadius: CGFloat = 8
    let mediumCornerRadius: CGFloat = 16
    let largCornerRadius: CGFloat = 24

    let smallAnimationTime: CGFloat = 0.2
    let mediumAnimationTime: CGFloat = 0.5
    let largeAnimationTime: CGFloat = 1

}

enum SFSymbol: String {
    case eyeFill = "eye.fill"
    case eyeSlashFill = "eye.slash.fill"
}
