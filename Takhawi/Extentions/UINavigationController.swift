//
//  UINavigationController.swift
//  Masar Ebdaa
//
//  Created by abdullah tarek on 19/09/2021.
//

import Foundation
import UIKit
//
extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}
