//
//  AppStoryBoard+UIViewController.swift
//  WritingService
//
//  Created by abdullah tarek on 25/05/2022.
//

import UIKit

public enum AppStoryboards: String {
    // Auth
    case Main

    // TABBAR
    case TabBar

    // More
    case More

    // Home
    case Home

    // AddNewProject
    case AddNewProject

    // Projects
    case Projects

    // Orders
    case Orders

    // Chat
    case Chat
}

extension AppStoryboards {
    public func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard let vc = UIStoryboard(name: rawValue, bundle: nil) // bundd
            .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
        else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(rawValue)") }
        return vc
    }

    public func instantiateWith(identifier: String) -> UIViewController {
        let vc = UIStoryboard(name: rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier)
        return vc
    }

    public func initialVC() -> UIViewController? {
        guard let vc = UIStoryboard(name: rawValue, bundle: nil).instantiateInitialViewController() else { return nil }
        return vc
    }

    public func viewController<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: nil)
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }

        return vc
    }
}

extension UIViewController {
    public static var storyboardIdentifier: String {
        return description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}

struct MGHelper {
    static func changeWindowRoot(vc: UIViewController) {
        UIApplication.shared.windows.first?.rootViewController = vc

        let window = UIApplication.shared.windows.first { $0.isKeyWindow }

        guard let window = window else { return }

        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }

    static func changeWindowRoot(vc: Any) {
//        UIApplication.shared.windows.first?.rootViewController = vc

        let window = UIApplication.shared.windows.first { $0.isKeyWindow }

        guard let window = window else { return }

        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
