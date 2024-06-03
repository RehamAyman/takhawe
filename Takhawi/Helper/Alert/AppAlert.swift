//
//  AppAlert.swift
//
//  Created by AAIT
//

import UIKit
import Lottie

// MARK: - Alert Action Types -
private enum AlertActions {
    case internetConnection
    case delete
    case login
    case logout
    case refuse
}
extension AlertActions {
    var imageName: String {
        switch self {
        case .internetConnection:
            return "no-wifi"
        case .delete:
            return "deleteImage"
        case .login:
            return "login"
        case .logout:
            return "login"
        case .refuse:
            return "warningAlert"
        }
    }
    var message: String {
        switch self {
        case .internetConnection:
            return "Please cheack your connection".localized
        case .delete:
            return "Do you Need to delete this Item?".localized
        case .login:
            return "Are you sure you want to logout?".localized
        case .logout:
            return "You should login first".localized
        case .refuse:
            return "Are you sure to refuse".localized
        }
    }
    var actionTitle: String {
        switch self {
        case .internetConnection:
            return "Try again".localized
        case .delete:
            return "Delete".localized
        case .login:
            return "Logout".localized
        case .logout:
            return "Login".localized
        case .refuse:
            return "Refuse".localized
        }
    }
}

// MARK: - Private Functions to Create all type of Alerts -
private func createAlert(message: String, type: AlertType = .error) {
    TopAlert.shared.type = type
    TopAlert.shared.message = message
    TopAlert.shared.showAnimate()
}
private func createAlert(action: AlertActions, completion: @escaping(() -> Void)) {

    // MARK: - ActionSheet Design -
    let actionSheet = UIAlertController(title: "\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
    let cancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
    let tryAgainAction = UIAlertAction(title: action.actionTitle, style: (action == .delete || action == .login) ? .destructive : .default, handler: { (_) in
        completion()
    })
    actionSheet.addAction(tryAgainAction)
    actionSheet.addAction(cancelAction)

    if #available(iOS 13.0, *) {
        actionSheet.overrideUserInterfaceStyle = .dark
        actionSheet.view.tintColor = .white
    }

    let subview = (actionSheet.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
    subview.backgroundColor = .clear// action.backgroundColor

    // MARK: - Design BackgroundView -
    let view = UIView(frame: CGRect(x: 8.0, y: 8.0, width: actionSheet.view.bounds.size.width - 8.0 * 4.5, height: 120.0))
    view.backgroundColor = UIColor.clear
    actionSheet.view.addSubview(view)

    // MARK: - Image Design -
    //OIuR07TvQK
    
    if action == .internetConnection {
         var  lottieView: LottieAnimationView?
        lottieView = .init(name:  "OIuR07TvQK")
        lottieView?.translatesAutoresizingMaskIntoConstraints = false
        
        if let lotti = lottieView {
            view.addSubview(lotti)
            lotti.loopMode = .loop
            lotti.contentMode = .scaleAspectFit
            lotti.play()
            lotti.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            lotti.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
            lotti.widthAnchor.constraint(equalToConstant: 45).isActive = true
            lotti.heightAnchor.constraint(equalToConstant: 45).isActive = true
            // MARK: - Message Body -
            let title = UILabel()
            title.textAlignment = .center
            title.numberOfLines = 0
            title.text = action.message
            title.textColor = .white
            title.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(title)
            title.topAnchor.constraint(equalTo: lotti.bottomAnchor).isActive = true
            title.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            title.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            
        }

          
    } else {
        let imageView = UIImageView()
        imageView.image = UIImage(named: action.imageName)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        // MARK: - Message Body -
        let title = UILabel()
        title.textAlignment = .center
        title.numberOfLines = 0
        title.text = action.message
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        title.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }

   

    // MARK: - present the action sheet -
    let window = UIApplication.shared.windows.first { $0.isKeyWindow }
    guard let window = window else {return}
    window.topViewController()?.present(actionSheet, animated: true)
}

// MARK: - App Alerts -
class AppAlert {

    // MARK: - Alert Without Action -
    static func showErrorAlert(error: String?) {
        activityIndicatorr.stopAnimating()
        showPopTopAlert(title:  "Error!".localized, withMessage: error ?? ""  , success: false )
       // createAlert(message: error ?? "Error".localized, type: .error)
    }
    static func showSuccessAlert(message: String?) {
       // createAlert(message: message ?? "Success".localized, type: .success)
        activityIndicatorr.stopAnimating()
        showPopTopAlert(title:  "Success".localized, withMessage: message ??  "", success: true  )
        
    }
    static func showSomethingError() {
        activityIndicatorr.stopAnimating()
        showPopTopAlert(title:  "Error!".localized, withMessage: "Something worng please try again later.".localized, success: false )
//        createAlert(message: "Something worng please try again later.".localized, type: .error)
    }

    static func showunaUthenticatedError(msg: String) {
        activityIndicatorr.stopAnimating()
        showPopTopAlert(title:  "Error!".localized, withMessage:  msg   , success: false )
        //createAlert(message: msg, type: .error)
    }
    // MARK: - Alert With Action -
    static func showInternetConnectionErrorAlert(completion: @escaping(() -> Void)) {
        activityIndicatorr.stopAnimating()
        createAlert(action: .internetConnection, completion: completion)
    }
    static func showDeleteAlert(complation: @escaping () -> Void) {
        createAlert(action: .delete, completion: complation)
    }
    static func showLogoutAlert(complation: @escaping () -> Void) {
        createAlert(action: .logout, completion: complation)
    }
    static func showLoginAlert(complation: @escaping () -> Void) {
        createAlert(action: .login, completion: complation)
    }
    static func showRefuseAlert(complation: @escaping () -> Void) {
        createAlert(action: .refuse, completion: complation)
    }
}

