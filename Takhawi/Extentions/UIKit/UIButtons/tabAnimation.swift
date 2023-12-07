//
//  tabAnimation.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import UIKit

extension UIButton {
    
    func animateButtonWhenPressed( completion: @escaping () -> Void)  {
        UIView.animate(withDuration: 0.2) {
            self.layer.transform = CATransform3DMakeScale( 1.2 , 1.2 , 1)
            
            
        } completion: { completed  in
            if completed {
                UIView.animate(withDuration: 0.2) {
                    self.layer.transform = CATransform3DMakeScale(1, 1, 1)
                    // do here any actionn after animation done !
                    
                    DispatchQueue.main.async {
                        completion()
                    }
                  
                    
                }
            }
        }
        
    }
    
    
    func animateSmallWhenPressed()  {
        UIView.animate(withDuration: 0.3) {
            self.layer.transform = CATransform3DMakeScale( 0.8  , 0.8  , 1)
            
            
        } completion: { completed  in
            if completed {
                UIView.animate(withDuration: 0.3) {
                    self.layer.transform = CATransform3DMakeScale(1, 1, 1)
                    // do here any actionn after animation done !
                    
                    
                }
            }
        }
        
    }
    
    
    
    func flash() {
    let flash = CABasicAnimation(keyPath: "opacity")
    flash.duration = 0.3
    flash.fromValue = 1
    flash.toValue = 0.1
    flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    flash.autoreverses = true
    flash.repeatCount = 2
    layer.add(flash, forKey: nil)
    }
    
    
    func pulsate() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.4
    pulse.fromValue = 0.98
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = .infinity
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    layer.add(pulse, forKey: nil)
    }
    
}



extension UIView {
    func flashh() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        layer.add(flash, forKey: nil)
    }
    
    func imagePulsate() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.4
    pulse.fromValue = 0.98
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = .infinity
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    layer.add(pulse, forKey: nil)
    }
    
    
    
}
