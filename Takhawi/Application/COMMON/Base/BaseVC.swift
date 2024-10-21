//
//  BaseVC.swift
//  WritingService
//
//  Created by Sara Mady on 08/03/2023.
//

import NVActivityIndicatorView
import SwiftMessages
import UIKit
import BottomPopup

enum BackGroundImage {
    case authBackGround
    case mainBackGround

    var image: UIImage {
        switch self {
        case .authBackGround:
            return UIImage(named: "FooBottomPopupdBg")!
        case .mainBackGround:
            return UIImage(named: "appBackGround")!
        }
    }
}

enum VCs: String {
    case LoginViewController
    case ConfirmCodeViewController
    case CompleteProfileViewController
}

protocol BaseView: AnyObject {
    func showLoader()
    func hideLoader()
    func showError(error: String)
    func showSuccess(title: String, massage: String)
    func showNoInternetConnection(action: @escaping (() -> Void))
}

class BaseVC: UIViewController {
    private var backgroundImage: UIImageView = UIImageView()

    deinit {
        print("\(NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? "BaseVC") is deinit, No memory leak found")
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.applicationIconBadgeNumber = 0
        self.navigationController?.isNavigationBarHidden = true
//        setupBackground()
    }

    func setupBackground() {
        switch storyboardId {
        case VCs.LoginViewController.rawValue, VCs.ConfirmCodeViewController.rawValue, VCs.CompleteProfileViewController.rawValue:
            backgroundImage.image = BackGroundImage.authBackGround.image
        default:
            backgroundImage.image = BackGroundImage.mainBackGround.image
        }

        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.layer.zPosition = -5
        view.addSubview(backgroundImage)

        view.sendSubviewToBack(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -40),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }

}

extension BaseVC: BaseView {
    func showLoader() {
//        startAnimating()
    }

    func hideLoader() {
//        stopAnimating()
    }

    func showError(error: String) {
//        showMessage(title: "Error".localized, sub: error, type: .error, layout: .messageView,iconText: "✕" )
    }

    func showSuccess(title: String, massage: String) {
//        showMessage(title: title, sub: massage, type: .success, layout: .messageView,iconText: "✓")
    }

    func showNoInternetConnection(action: @escaping (() -> Void)) {
        let alert = UIAlertController(title: "Connection error".localized, message: "There was a connection error, make sure you have an internet connection and try again".localized, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Try again".localized, style: .default, handler: { _ in
            action()
        }))
        UIDevice.vibrate()
        present(alert, animated: true, completion: nil)
    }
    
    func shareLink(from viewController: UIViewController, urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        // Create a UIActivityViewController with the link
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        // Optionally exclude some activity types (optional)
        activityViewController.excludedActivityTypes = [
            .assignToContact,
            .addToReadingList,
            .saveToCameraRoll
        ]
        
        // Present the Activity View Controller
        viewController.present(activityViewController, animated: true, completion: nil)
    }
    
    
   
    
    
    
    func loginAsVisitor(dismiss: Bool? = false, action: @escaping (() -> Void)) {
        if defult.shared.getData(forKey: .token) == "" || defult.shared.getData(forKey: .token) == nil {
            let alert = UIAlertController(title: "Worning".localized, message: "You must login to continue".localized, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Login".localized, style: .default, handler: { _ in
                let storyboard = UIStoryboard(name: StoryBoard.Main.rawValue, bundle: nil)

//                let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                vc.isVisitor = true
//                vc.visitorView = self.classForCoder
//                self.navigationController?.pushViewController(vc, animated: true)
            }))

            alert.addAction(UIAlertAction(title: "Cancel".localized, style: .destructive, handler: { _ in
                if dismiss == true {
                    self.dismiss(animated: true)
                } else {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }))
            present(alert, animated: true, completion: nil)
        } else {
            action()
        }
    }
}

// NVActivityIndicatorViewable
// MARK: - Base Extention
// extension BottomPopupViewController : BaseView , NVActivityIndicatorView{
//    func showLoader() {
////        startAnimating()
//    }
//    
//    func hideLoader() {
////        stopAnimating()
//    }
//    
//    func showError(error : String) {
//        self.showMessage(title: "Error".localized, sub: error, type: .error, layout: .messageView, iconText: "✕")
//    }
//    
//    func showSuccess(title : String,massage : String) {
//        self.showMessage(title: title, sub: massage, type: .success, layout: .messageView, iconText: "✓")
//    }
//    
//    func showNoInternetConnection(action: @escaping (()->())) {
//        let alert = UIAlertController(title: "Connection error".localized, message: "There was a connection error, make sure you have an internet connection and try again".localized, preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Cancel".localized, style: UIAlertAction.Style.default, handler: nil))
//        alert.addAction(UIAlertAction(title: "Try again".localized, style: UIAlertAction.Style.default,handler: { _ in
//            action()
//        }))
//        self.present(alert, animated: true, completion: nil)
//    }
// }

// MARK: - Router -
extension BaseVC {
    func push(_ viewController: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    func pop(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
    func popToRoot(animated: Bool = true) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromTop
        self.view.window?.layer.add(transition, forKey: kCATransition)

        present(viewControllerToPresent, animated: false, completion: nil)
    }
    func dismissTopDetail() {
        let transition = CATransition()
        transition.duration = 0.8
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromTop
        self.view.window?.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false, completion: nil)
    }

    func dismissBottomDetail() {
        let transition = CATransition()
        transition.duration = 0.8
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.window?.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false, completion: nil)
    }
}

extension BaseVC {
    func savePdf(urlString: String, fileName: String) {
            DispatchQueue.main.async {
                let url = URL(string: urlString)
                let pdfData = try? Data.init(contentsOf: url!)
                let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
                let pdfNameFromUrl = "YourAppName-\(fileName).pdf"
                let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
                do {
                    try pdfData?.write(to: actualPath, options: .atomic)
                    print("pdf successfully saved!")
                } catch {
                    print("Pdf could not be saved")
                }
            }
        }

        func showSavedPdf(url: String, fileName: String) {
            if #available(iOS 10.0, *) {
                do {
                    let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
                    for url in contents {
                        if url.description.contains("\(fileName).pdf") {
                           // its your file! do what you want with it!

                    }
                }
            } catch {
                print("could not locate pdf file !!!!!!!")
            }
        }
    }

    // check to avoid saving a file multiple times
    func pdfFileAlreadySaved(url: String, fileName: String) -> Bool {
        var status = false
        if #available(iOS 10.0, *) {
            do {
                let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
                for url in contents {
                    if url.description.contains("YourAppName-\(fileName).pdf") {
                        status = true
                    }
                }
            } catch {
                print("could not locate pdf file !!!!!!!")
            }
        }
        return status
    }
}
extension BaseVC: UIDocumentInteractionControllerDelegate {

    func openFile(path: String) {
        let dc = UIDocumentInteractionController(url: URL(fileURLWithPath: path))
        dc.delegate = self
        dc.presentPreview(animated: true)
    }
    // MARK: UIDocumentInteractionController delegates
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self// or use return self.navigationController for fetching app navigation bar colour
    }
}
