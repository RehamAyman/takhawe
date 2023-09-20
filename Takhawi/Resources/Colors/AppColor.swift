//
//  UITableViewExtension.swift
//
//  Created by Abdullah Tarek on 15/9/21.
//  Copyright © 2021 Abdullah Tarek. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

final class AppColors {

    static let shared: AppColors = AppColors()

    private init() {}

    private func createColor(named: ColorNames) -> UIColor {
        guard let color = UIColor(named: named.rawValue) else {
            fatalError("No color found in assetes with the name \(named.rawValue) please add the color with this name to it")
        }
        return color
    }

    // MARK: - Names -
    private enum ColorNames: String {
        case BackGroundColor
        case BorderColor

        case MainColor
        case MainFontColor
        case myMessageChatColor
        case otherMessageChatColor
        case placeHolderColor
        case SecondaryMainColor
        case SecondViewBackGround
        case ErrorColor
        case SuccessAddCoupn
        case TextFieldBackGroundColor
        case SecondFontColor
        case successColor
        case warningColor
        case shadowColor

    }

    // MARK: - Font -
    var mainDarkFontColor: UIColor {
        return createColor(named: .MainFontColor)
    }
    var secondryDarkFontColor: UIColor {
        return createColor(named: .SecondFontColor)
    }
//    var mainLightFontColor: UIColor {
//        return createColor(named: .mainLightFontColor)
//    }
//    var secondryLightFontColor: UIColor  {
//        return createColor(named: .secondryLightFontColor)
//    }

    // MARK: - Alerts -
    var errorColor: UIColor {
        return createColor(named: .ErrorColor)
    }
    var successColor: UIColor {
        return createColor(named: .successColor)
    }
    var warningColor: UIColor {
        return createColor(named: .warningColor)
    }

    // MARK: - Views -
//    var whiteColor: UIColor {
//        return createColor(named: .whiteColor)
//    }
//    var blackColor: UIColor {
//        return createColor(named: .blackColor)
//    }

    var mainColor: UIColor {
        return createColor(named: .MainColor)
    }
    var placeHolderColor: UIColor {
        return createColor(named: .placeHolderColor)
    }
//    var secondaryColor: UIColor {
//        return createColor(named: .secondaryColor)
//    }
//    var secondaryColorWithAlph: UIColor {
//        return createColor(named: .secondaryColorWithAlph)
//    }

    var mainBackgroundColor: UIColor {
        return createColor(named: .BackGroundColor)
    }
//    var secondaryBackgroundColor: UIColor {
//        return createColor(named: .secondaryBackgroundColor)
//    }

    var borderUIColor: UIColor {
        return createColor(named: .BorderColor)
    }

    // MARK: - Layers -
    var shadowColor: CGColor {
        return createColor(named: .shadowColor).cgColor
    }
    var borderColor: CGColor {
        return createColor(named: .BorderColor).cgColor
    }

    // MARK: - Chat -
    var myMessageChatColor: UIColor {
        return createColor(named: .myMessageChatColor)
    }

    var otherMessageChatColor: UIColor {
        return createColor(named: .otherMessageChatColor)
    }
}
