//
//  Extensions+Bundle.swift
//  Veterinary
//
//  Created by Mohammed Abouarab on 08/12/2021.
//

import UIKit

//extension Bundle {
//
//    static func swizzleLocalization() {
//        let orginalSelector = #selector(localizedString(forKey:value:table:))
//        guard let orginalMethod = class_getInstanceMethod(self, orginalSelector) else { return }
//
//        let mySelector = #selector(myLocaLizedString(forKey:value:table:))
//        guard let myMethod = class_getInstanceMethod(self, mySelector) else { return }
//
//        if class_addMethod(self, orginalSelector, method_getImplementation(myMethod), method_getTypeEncoding(myMethod)) {
//            class_replaceMethod(self, mySelector, method_getImplementation(orginalMethod), method_getTypeEncoding(orginalMethod))
//        } else {
//            method_exchangeImplementations(orginalMethod, myMethod)
//        }
//    }
//
//    @objc private func myLocaLizedString(forKey key: String, value: String?, table: String?) -> String {
//        DispatchQueue.main.async {
//            guard let _ = UIApplication.shared.delegate as? AppDelegate else {
//                return
//            }
//        }
//        guard let bundlePath = Bundle.main.path(forResource: Language.currentLanguage(), ofType: "lproj"),
//            let bundle = Bundle(path: bundlePath) else {
//                return Bundle.main.myLocaLizedString(forKey: key, value: value, table: table)
//        }
//        return bundle.myLocaLizedString(forKey: key, value: value, table: table)
//    }
//}
