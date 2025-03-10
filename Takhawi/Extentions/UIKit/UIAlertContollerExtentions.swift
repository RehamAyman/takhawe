//
//  UIAlertContollerExtentions.swift
//  WritingService
//
//  Created by abdullah tarek on 03/07/2022.
//

import Foundation
import UIKit

final class DatePickerViewController: UIViewController {
    public typealias Action = (Date) -> Void

    fileprivate var action: Action?

    fileprivate lazy var datePicker: UIDatePicker = { [unowned self] in
        $0.addTarget(self, action: #selector(DatePickerViewController.actionForDatePicker), for: .valueChanged)
        return $0
    }(UIDatePicker())

    required init(mode: UIDatePicker.Mode, date: Date? = nil, minimumDate: Date? = nil, maximumDate: Date? = nil, action: Action?) {
        super.init(nibName: nil, bundle: nil)
        datePicker.datePickerMode = mode
        datePicker.sizeToFit()
        datePicker.locale = LocalizationManager.shared.getLanguage() == .Arabic  ? Locale(identifier: "ar") : Locale(identifier: "en")
        datePicker.date = date ?? Date()

        if #available(iOS 13.4, *) {
            datePicker.overrideUserInterfaceStyle = .dark
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
        self.action = action
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        Log("has deinitialized")
    }

    override func loadView() {
        view = datePicker
    }

    @objc func actionForDatePicker() {
        action?(datePicker.date)
    }

    public func setDate(_ date: Date) {
        datePicker.setDate(date, animated: true)
    }
}

extension UIAlertController {
    func addDatePicker(mode: UIDatePicker.Mode, date: Date?, minimumDate: Date? = nil, maximumDate: Date? = nil, action: DatePickerViewController.Action?) {
        let datePicker = DatePickerViewController(mode: mode, date: date, minimumDate: minimumDate, maximumDate: maximumDate, action: action)
        set(vc: datePicker, height: 217)
    }

    /// Set alert's content viewController
    ///
    /// - Parameters:
    /// - vc: ViewController
    /// - height: height of content viewController
    func set(vc: UIViewController?, width: CGFloat? = nil, height: CGFloat? = nil) {
        guard let vc = vc else { return }
        setValue(vc, forKey: "contentViewController")
        if let height = height {
            vc.preferredContentSize.height = height
            preferredContentSize.height = height
        }
    }
}

public func Log<T>(_ object: T?, filename: String = #file, line: Int = #line, funcname: String = #function) {
#if DEBUG
    guard let object = object else { return }
    print("***** \(Date()) \(filename.components(separatedBy: "/").last ?? "") (line: \(line)) :: \(funcname) :: \(object)")
#endif
}

import AudioToolbox

// MARK: - Initializers
extension UIAlertController {

    /// Create new alert view controller.
    ///
    /// - Parameters:
    /// - style: alert controller's style.
    /// - title: alert controller's title.
    /// - message: alert controller's message (default is nil).
    /// - defaultActionButtonTitle: default action button title (default is "OK")
    /// - tintColor: alert controller's tint color (default is nil)
    convenience init(style: UIAlertController.Style, source: UIView? = nil, title: String? = nil, message: String? = nil, tintColor: UIColor? = nil) {
        self.init(title: title, message: message, preferredStyle: style)

        // TODO: for iPad or other views
        let isPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
        let root = UIApplication.shared.windows.first?.rootViewController?.view

        // self.responds(to: #selector(getter: popoverPresentationController))
        if let source = source {
            Log("----- source")
            popoverPresentationController?.sourceView = source
            popoverPresentationController?.sourceRect = source.bounds
        } else if isPad, let source = root, style == .actionSheet {
            Log("----- is pad")
            popoverPresentationController?.sourceView = source
            popoverPresentationController?.sourceRect = CGRect(x: source.bounds.midX, y: source.bounds.midY, width: 0, height: 0)
            // popoverPresentationController?.permittedArrowDirections = .down
            popoverPresentationController?.permittedArrowDirections = .init(rawValue: 0)
        }

        if let color = tintColor {
            self.view.tintColor = color
        }
    }
}

// MARK: - Methods
extension UIAlertController {

    /// Present alert view controller in the current view controller.
    ///
    /// - Parameters:
    /// - animated: set true to animate presentation of alert controller (default is true).
    /// - vibrate: set true to vibrate the device while presenting the alert (default is false).
    /// - completion: an optional completion handler to be called after presenting alert controller (default is nil).
    public func show(animated: Bool = true, vibrate: Bool = false, style: UIBlurEffect.Style? = nil, completion: (() -> Void)? = nil) {

        /// TODO: change UIBlurEffectStyle
        if let style = style {
            for subview in view.allSubViewsOf(type: UIVisualEffectView.self) {
                subview.effect = UIBlurEffect(style: style)
            }
        }

        DispatchQueue.main.async {
            UIApplication.shared.windows.first?.rootViewController?.present(self, animated: animated, completion: completion)
            if vibrate {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            }
        }
    }

    /// Add an action to Alert
    ///
    /// - Parameters:
    /// - title: action title
    /// - style: action style (default is UIAlertActionStyle.default)
    /// - isEnabled: isEnabled status for action (default is true)
    /// - handler: optional action handler to be called when button is tapped (default is nil)
    func addAction(image: UIImage? = nil, title: String, color: UIColor? = nil, style: UIAlertAction.Style = .default, isEnabled: Bool = true, handler: ((UIAlertAction) -> Void)? = nil) {
        // let isPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
        // let action = UIAlertAction(title: title, style: isPad && style == .cancel ? .default : style, handler: handler)
        let action = UIAlertAction(title: title, style: style, handler: handler)

        action.isEnabled = isEnabled

        // button image
        if let image = image {
            action.setValue(image, forKey: "image")
        }

        // button title color
        if let color = color {
            action.setValue(color, forKey: "titleTextColor")
        }

        addAction(action)
    }

    /// Set alert's title, font and color
    ///
    /// - Parameters:
    /// - title: alert title
    /// - font: alert title font
    /// - color: alert title color
    func set(title: String?, font: UIFont, color: UIColor) {
        if title != nil {
            self.title = title
        }
        setTitle(font: font, color: color)
    }

    func setTitle(font: UIFont, color: UIColor) {
        guard let title = self.title else { return }
        let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: color]
        let attributedTitle = NSMutableAttributedString(string: title, attributes: attributes)
        setValue(attributedTitle, forKey: "attributedTitle")
    }

    /// Set alert's message, font and color
    ///
    /// - Parameters:
    /// - message: alert message
    /// - font: alert message font
    /// - color: alert message color
    func set(message: String?, font: UIFont, color: UIColor) {
        if message != nil {
            self.message = message
        }
        setMessage(font: font, color: color)
    }

    func setMessage(font: UIFont, color: UIColor) {
        guard let message = self.message else { return }
        let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: color]
        let attributedMessage = NSMutableAttributedString(string: message, attributes: attributes)
        setValue(attributedMessage, forKey: "attributedMessage")
    }

}

// private func setupFromTime(sender: UITextField) {
//        timePicker.datePickerMode = .time
//        timePicker.preferredDatePickerStyle = .wheels
//
//        let toolBar = UIToolbar()
//        toolBar.barStyle = UIBarStyle.default
//        toolBar.isTranslucent = true
//        toolBar.tintColor = .appColor(.MainColor)
//        toolBar.sizeToFit()
//
//        let doneButton = UIBarButtonItem(title: "confirm".localized, style: .plain, target: self, action: #selector(doneFromTimeTapped))
//        toolBar.setItems([doneButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
//
//        fromTf.inputView = timePicker
//        fromTf.inputAccessoryView = toolBar
//        fromTf.tintColor = UIColor.clear
//
//        toTf.inputView = timePicker
//        toTf.inputAccessoryView = toolBar
//        toTf.tintColor = UIColor.clear
//    }
//
//    @objc func doneFromTimeTapped(sender: UITextField) {
//        dateFormatter.dateFormat = "HH:mm"
//        if sender == fromTf {
//            fromTf.text = dateFormatter.string(from: timePicker.date)
//        } else {
//            toTf.text = dateFormatter.string(from: timePicker.date)
//        }
//
//        endEditing(true)
//    }
// }
