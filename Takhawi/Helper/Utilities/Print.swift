//
//  Print.swift
//
//  Created by AAIT
//

import Foundation

public func print(_ object: Any...) {
    #if DEBUG
    Swift.print(object)
    #endif
}
public func print(_ object: Any) {
    #if DEBUG
    Swift.print(object)
    #endif
}
