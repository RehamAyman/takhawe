//
//  Optional.swift
//
//  Created by AAIT
//

import Foundation

extension Optional where Wrapped == Bool {
    mutating func toggleOptinal() -> Bool {
        guard let value = self else {
            return true
        }
        return !value
    }
}
