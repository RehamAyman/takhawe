////
////  Fonts.swift
////
////  Created by AAIT
////
//
import UIKit

// MARK: - To exchange the system font to Specific font -
/*
 The limitition of this Method is you can't change more than 3 sizes for system font
 */
extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}
extension UIFont {

    // MARK: - Enum
    enum FontNames: String {

        case light
        case normal
        case bold

        
    //    ["Cairo-Regular", "Cairo-Bold"]
     //["Cairo-SemiBold"] // Cairo-Black
        var name: String {

            let lightNameAr = "Cairo-SemiBold"
            let normalNameAr = "Cairo-Bold"
            let boldNameAr = "Cairo-Black"
            let lightNameEn = "HelveticaNeue"
            let normalNameEn = "HelveticaNeue-Medium"
            let boldNameEn = "HelveticaNeue-Bold"

            switch self {
            case .light:
                return LocalizationManager.shared.getLanguage() == .Arabic ? lightNameAr : lightNameEn
            case .normal:
                return LocalizationManager.shared.getLanguage() == .Arabic ?  normalNameAr : normalNameEn
            case .bold:
                return LocalizationManager.shared.getLanguage() == .Arabic ? boldNameAr : boldNameEn
            }
        }

    }

    // MARK: - Objc Methods
    @objc class func myLightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontNames.light.name, size: size)!
    }
    @objc class func myRegularFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontNames.normal.name, size: size)!
    }
    @objc class func myBoldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontNames.bold.name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    @objc convenience init?(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
            self.init(myCoder: aDecoder)
            return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontLightUsage":
            fontName = FontNames.light.name
        case "CTFontRegularUsage":
            fontName = FontNames.normal.name
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
            fontName = FontNames.bold.name
        default:
            fontName = FontNames.normal.name
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)
    }

    // MARK: - Initilization
    class func overrideInitialize() {
        
        
        guard self == UIFont.self else { return }
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))), let mySystemFontMethod = class_getClassMethod(self, #selector(myRegularFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))), let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))), let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myLightFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
        // Trick to get over the lack of UIFont.init(coder:))
    }
}

/*
 This also to change font for all the app font but at some cases font not cahnge (ex:- UIAlertController action fonts) so we use the above extension too
 */
enum FontFamilyName: String {
    case DINArabic = "Alexandria"
}

enum AppFont: String {
    case Light = "Alexandria-Light"
    case Regular = "HelveticaNeue-Regular" 
    case Medium = "HelveticaNeue-Medium"
    case Demi = "Alexandria-SemiBold"
    case Bold = "HelveticaNeue-Bold"
    case Black = "Alexandria-Black"
    case arBold = "Cairo-Black"
    case arRegular = "Cairo-SemiBold"
    case arMedium = "Cairo-Bold"
    
    
    
    
    
}




extension UILabel {
    @objc var substituteFontName: String {
        get {
            return self.font.fontName
        }
        set {
            let fontNameToTest = self.font.fontName.lowercased()
            var fontName = newValue

            if fontNameToTest.range(of: "black") != nil {
                fontName += "-Black"
            } else if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold"
            } else if fontNameToTest.range(of: "semibold") != nil {
                fontName += "-SemiBold"
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium"
            } else if fontNameToTest.range(of: "regular") != nil {
                fontName += "-Regular"
            } else {
                fontName += "-SemiBold"
            }

            self.font = UIFont(name: fontName, size: self.font.pointSize)
        }
    }
}
extension UITextView {
    @objc var substituteFontName: String {
        get {
            return self.font?.fontName ?? ""
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? ""
            var fontName = newValue

            if fontNameToTest.range(of: "black") != nil {
                fontName += "-Black"
            } else if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold"
            } else if fontNameToTest.range(of: "semibold") != nil {
                fontName += "-SemiBold"
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium"
            } else if fontNameToTest.range(of: "regular") != nil {
                fontName += "-Regular"
            } else {
                fontName += "-SemiBold"
            }

            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
}
extension UITextField {
    @objc var substituteFontName: String {
        get {
            return self.font?.fontName ?? ""
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? ""
            var fontName = newValue

            if fontNameToTest.range(of: "black") != nil {
                fontName += "-Black"
            } else if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold"
            } else if fontNameToTest.range(of: "semibold") != nil {
                fontName += "-SemiBold"
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium"
            } else if fontNameToTest.range(of: "regular") != nil {
                fontName += "-Regular"
            } else {
                fontName += "-SemiBold"
            }

            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
}



//extension UIFontDescriptor.AttributeName {
//    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
//}
//extension UIFont {
//
//    // MARK: - Enum
//    enum FontNames: String {
//
//        case light
//        case regular
//        case bold
//        case boldItalic
//
//        var name: String {
//            
//            let lightName = "alfont_com_AlFont_com_SST-Arabic-Light"
//            let regularName =  "SSTArabic-Roman"
//            let boldName =  "SSTArabic-Bold"
//            let boldItalicName = "alfont_com_AlFont_com_SST-Arabic-Bold-2"
//
//            switch self {
//            case .light:
//                return lightName
//            case .regular:
//                return regularName
//            case .bold:
//                return boldName
//            case .boldItalic:
//                return boldItalicName
//            }
//        }
//
//    }
//
//    // MARK: - Objc Methods
//    @objc class func myLightFont(ofSize size: CGFloat) -> UIFont {
//        return UIFont(name: FontNames.light.name, size: size)!
//    }
//    @objc class func myRegularFont(ofSize size: CGFloat) -> UIFont {
//        
//        
//        return UIFont(name: FontNames.regular.name, size: size)!
//    }
//    @objc class func myBoldFont(ofSize size: CGFloat) -> UIFont {
//        
//        return UIFont(name: FontNames.bold.name, size: size)!
//    }
//    @objc convenience init(myCoder aDecoder: NSCoder) {
//        guard
//            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
//            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
//            self.init(myCoder: aDecoder)
//            return
//        }
//        var fontName = ""
//        switch fontAttribute {
//        case "CTFontLightUsage":
//            fontName = FontNames.light.name
//        case "CTFontRegularUsage":
//            fontName = FontNames.regular.name
//        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
//            fontName = FontNames.bold.name
//        default:
//            fontName = FontNames.regular.name
//        }
//        self.init(name: fontName, size: fontDescriptor.pointSize)!
//    }
//
//    // MARK: - Initilization
//    class func overrideInitialize() {
//        guard self == UIFont.self else { return }
//        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))), let mySystemFontMethod = class_getClassMethod(self, #selector(myRegularFont(ofSize:))) {
//            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
//        }
//        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))), let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldFont(ofSize:))) {
//            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
//        }
//        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))), let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myLightFont(ofSize:))) {
//            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
//        }
//        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
//            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
//        }
//        // Trick to get over the lack of UIFont.init(coder:))
//    }
//}
//
//enum FontFamilyName: String {
//    case DINArabic = "29LT Bukra"
//}
//
//
//    enum AppFont: String {
//        case Light = "Alexandria-Light"
//        case Regular = "HelveticaNeue-Regular"
//        case Medium = "HelveticaNeue-Medium"
//        case Demi = "Alexandria-SemiBold"
//        case Bold = "HelveticaNeue-Bold"
//        case Black = "Alexandria-Black"
//    }
//
//    
//
//
//extension UILabel {
//    @objc var substituteFontName: String {
//        get {
//            return self.font.fontName
//        }
//        set {
//            let fontNameToTest = self.font.fontName.lowercased()
//            var fontName = newValue
//
//            if fontNameToTest.range(of: "black") != nil {
//                fontName += "-Black"
//            } else if fontNameToTest.range(of: "bold") != nil {
//                fontName += "-Bold"
//            } else if fontNameToTest.range(of: "semibold") != nil {
//                fontName += "-SemiBold"
//            } else if fontNameToTest.range(of: "medium") != nil {
//                fontName += "-Medium"
//            } else if fontNameToTest.range(of: "regular") != nil {
//                fontName += "-Regular"
//            } else {
//                fontName += "-SemiBold"
//            }
//
//            self.font = UIFont(name: fontName, size: self.font.pointSize)
//        }
//    }
//}
//extension UITextView {
//    @objc var substituteFontName: String {
//        get {
//            return self.font?.fontName ?? ""
//        }
//        set {
//            let fontNameToTest = self.font?.fontName.lowercased() ?? ""
//            var fontName = newValue
//
//            if fontNameToTest.range(of: "black") != nil {
//                fontName += "-Black"
//            } else if fontNameToTest.range(of: "bold") != nil {
//                fontName += "-Bold"
//            } else if fontNameToTest.range(of: "semibold") != nil {
//                fontName += "-SemiBold"
//            } else if fontNameToTest.range(of: "medium") != nil {
//                fontName += "-Medium"
//            } else if fontNameToTest.range(of: "regular") != nil {
//                fontName += "-Regular"
//            } else {
//                fontName += "-SemiBold"
//            }
//
//            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
//        }
//    }
//}
//extension UITextField {
//    @objc var substituteFontName: String {
//        get {
//            return self.font?.fontName ?? ""
//        }
//        set {
//            let fontNameToTest = self.font?.fontName.lowercased() ?? ""
//            var fontName = newValue
//
//            if fontNameToTest.range(of: "black") != nil {
//                fontName += "-Black"
//            } else if fontNameToTest.range(of: "bold") != nil {
//                fontName += "-Bold"
//            } else if fontNameToTest.range(of: "semibold") != nil {
//                fontName += "-SemiBold"
//            } else if fontNameToTest.range(of: "medium") != nil {
//                fontName += "-Medium"
//            } else if fontNameToTest.range(of: "regular") != nil {
//                fontName += "-Regular"
//            } else {
//                fontName += "-SemiBold"
//            }
//
//            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
//        }
//    }
//}
