//
//  Double.swift
//
//  Created by AAIT
//

import Foundation

extension Double {
    func toPrice() -> String {
        return String(format: "%.01f", self) + " " + "SAR".localized
    }
    func toKiloMeter() -> String {
        return String(format: "%.01f", self) + " " + "Km".localized
    }

    func toKG() -> String {
        return String(format: "%.01f", self) + " " + "KG".localized
    }

    func toString() -> String {
        return String(format: "%.01f", self)
    }
}

extension Int {
    // isEven: -- self % 2 == 0
    var isEven: Bool { self.isMultiple(of: 2) }

    func toHoures() -> String {
        return String(describing: self) + " " + "Houres".localized
    }

    func toApiTimeAM() -> String {
        return "0\(String(describing: self)):00"
    }

    func toApiTimePM() -> String {
        return "\(String(describing: self)):00"
    }

    func toTimeAM() -> String {
        if self == 0 {
            return String(describing: 12) + " " + "AM".localized
        } else {
            return String(describing: self) + " " + "AM".localized
        }
    }

    func toTimePM() -> String {
        let time = self - 12
        if time == 0 {
            return String(describing: 12) + " " + "PM".localized
        } else {
            return String(describing: time) + " " + "PM".localized
        }

    }
}
