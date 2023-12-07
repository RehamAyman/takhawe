//
//  shadow.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import UIKit


extension CALayer {
  func applySketchShadow(
    color: UIColor = .systemGray4,
    alpha: Float = 0.5,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 4,
    spread: CGFloat = 0)
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
    
    func addBasicShadow (cornerRadius : Float) {
        self.cornerRadius = CGFloat(cornerRadius)
        self.shadowColor = UIColor.lightGray.cgColor
        self.shadowOffset = CGSize(width: 0, height: 0)
        self.shadowOpacity = 0.55
        self.shadowRadius = 3.0
    }
    
    
    
    func addTopShadow () {
        self.shadowColor = UIColor.black.cgColor
        self.shadowRadius = 3
        self.shadowOffset = CGSize(width: 3, height: -3)
    }
    
    
}

extension UIView {
    
   
    
    func addCornersShadow(){
        
        layer.cornerRadius = 20
        clipsToBounds = false
        layer.borderWidth = 0.2

        layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner ,  .layerMinXMaxYCorner , .layerMinXMinYCorner]



        layer.shadowColor = UIColor.darkGray.cgColor

        layer.shadowOffset = CGSize(width: 20.0 , height: 0.0 )

        //layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 0.2


        layer.shadowPath = UIBezierPath(roundedRect: self.bounds , cornerRadius: 5 ).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.contents = center
       

    }

    
    
    
       func addTopLeftCoreners (num : CGFloat ) {
           
          layer.cornerRadius = num
          layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]
           
       }

    
   
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
    
    
    func addRoundedshadwo () {
   layer.cornerRadius = 12
   layer.masksToBounds = true;

      // backgroundColor = UIColor.white
       layer.shadowColor = UIColor.lightGray.cgColor
       layer.shadowOpacity = 0.8
       layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
      layer.shadowRadius = 6.0
       layer.masksToBounds = false
    }
    

       func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
 
    
    
    func AddTOPCornersView (num : CGFloat ) {
            
      layer.cornerRadius = num
      layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]
         
    }
    
    
    func addBottomCornersView (num : CGFloat ) {
            //layerMinXMinYCorner
      layer.cornerRadius = num
        layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
         
    }
    
    
    
}
