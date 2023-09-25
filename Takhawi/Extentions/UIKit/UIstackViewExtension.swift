//
//  UIstackViewExtension.swift
//  Marsol Awamer
//
//  Created by abdullah tarek on 29/12/2021.
//

import Foundation
import UIKit
extension UIStackView {

    private enum AnimationDirection {
        case up
        case down
        case left
        case right
    }
    private func reloadData(animationDirection: AnimationDirection) {
        self.layoutIfNeeded()
        let views = self.arrangedSubviews
        var index = 0
        let tableHeight: CGFloat = self.bounds.size.height
        for i in views {
            let cell = i as UIView
            switch animationDirection {
            case .up:
                cell.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
                break
            case .down:
                cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
                break
            case .left:
                cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                break
            case .right:
                cell.transform = CGAffineTransform(translationX: -tableHeight, y: 0)
                break
            }
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
    }
    func animateToLeft() {
        self.reloadData(animationDirection: .left)
    }
    func animateToRight() {
        self.reloadData(animationDirection: .right)
    }
    func animateToTop() {
        self.reloadData(animationDirection: .down)
    }
    func animateToBottom() {
        self.reloadData(animationDirection: .up)
    }

    
    
    
// added
    
//MARK: - BUS ANIMATION 🚗
    func busAnimation  ( item : UIImageView) {
        self.reloadBusItem(animationDirection: .right, item: item)
    }
    

    private func reloadBusItem(animationDirection: AnimationDirection , item : UIImageView) {
        self.layoutIfNeeded()
        let views = self.arrangedSubviews
        let tableHeight: CGFloat = self.bounds.size.height

        for i in views {
            
            if i == item {
                
                switch animationDirection {
                case .up:
                    item.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
                    break
                case .down:
                    item.transform = CGAffineTransform(translationX: 0, y: tableHeight)
                    break
                case .left:
                    item.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                    break
                case .right:
                    item.transform = CGAffineTransform(translationX: -tableHeight, y: 0)
                    break
                }
                UIView.animate(withDuration: 1.0, delay: 0.08 , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                    item.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
                
            }
            
            
         
           
           
        }
    }
}



