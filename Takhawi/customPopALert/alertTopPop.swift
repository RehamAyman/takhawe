//
//  alertTopPop.swift
//  Takhawi
//
//  Created by Mac on 02/01/2024.
//

import Foundation
import JDStatusBarNotification



func showPopTopAlert ( title : String ,withMessage : String , success : Bool) {
    let image = UIImageView(image: UIImage(named: "sun 1"))
   
    NotificationPresenter.shared.displayLeftView(image)
    NotificationPresenter.shared.updateDefaultStyle { style in
        style.backgroundStyle.backgroundColor = success ?  UIColor(named: "popcolor") : UIColor(named: "AppRed")
        style.textStyle.textColor = .white
        style.subtitleStyle.textColor = .white
    
    style.textStyle.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        
       // and many more options
       return style
    }
    
    NotificationPresenter.shared.present( title , subtitle: withMessage )
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8 ) {
        NotificationPresenter.shared.dismiss(animated: true )
    }
    
    
   
}
