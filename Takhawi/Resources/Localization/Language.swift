//
//  Language.swift
//  Veterinary
//
//  Created by Mohammed Abouarab on 08/12/2021.
//

import Foundation
import UIKit
import Cosmos

struct Language {

    enum Languages {
        static let en = "en"
        static let ar = "ar"
        static let ur = "ur"
    }

    static func currentLanguage() -> String {
        let langs = UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray
        let firstLang = langs.firstObject as! String
        return firstLang
    }

    static func setAppLanguage(lang: String) {
        UserDefaults.standard.set([lang, currentLanguage()], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        updateUIDirection()
//        updateAppGroupLanguage()
    }

    static func apiLanguage() -> String {
        if self.currentLanguage().contains(Languages.ar) {
            return Languages.ar
        } else if self.currentLanguage().contains(Languages.en) {
            return Languages.en
        } else {
            return Languages.ur
        }
    }

    static func isRTL() -> Bool {
        if self.currentLanguage().contains(Languages.ar) || self.currentLanguage().contains(Languages.ur) {
            return true
        } else {
            return false
        }
    }

    static func updateUIDirection() {
        UIPageControl.appearance().semanticContentAttribute = Language.isRTL() ? .forceRightToLeft : .forceLeftToRight
        UIStackView.appearance().semanticContentAttribute = Language.isRTL() ? .forceRightToLeft : .forceLeftToRight
        UISwitch.appearance().semanticContentAttribute = Language.isRTL() ? .forceRightToLeft : .forceLeftToRight
        UIView.appearance().semanticContentAttribute = Language.isRTL() ? .forceRightToLeft : .forceLeftToRight
        UICollectionView.appearance().semanticContentAttribute = Language.isRTL() ? .forceRightToLeft : .forceLeftToRight
        UIDatePicker.appearance().semanticContentAttribute = Language.isRTL() ? .forceRightToLeft : .forceLeftToRight
        UIPickerView.appearance().semanticContentAttribute = Language.isRTL() ? .forceRightToLeft : .forceLeftToRight
        CosmosView.appearance().semanticContentAttribute = Language.isRTL() ? .forceRightToLeft : .forceLeftToRight
        UITextField.appearance().textAlignment = Language.isRTL() ? .right : .left
        UITextView.appearance().textAlignment = Language.isRTL() ? .right : .left

    }

//    static func updateAppGroupLanguage() {
//
//        if let userDefaults = UserDefaults(suiteName: AppDelegate.appGroupKey) {
//            userDefaults.setValue(currentLanguage(), forKey: "AppleLanguages")
//            userDefaults.synchronize()
//        }
//    }
}
