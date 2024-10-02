//
//  selectDateExtention.swift
//  Takhawi
//
//  Created by Reham Ayman on 18/10/2023.
//

import UIKit



extension selectDateVC {
    
   
    

    func impedCalendarSwiftui () {
       // swiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(swiftUIView)
       // swiftUIView.view.frame = calendarView.bounds
        let screenSize = UIScreen.main.bounds
        swiftUIView.view.centerInSuperview(size: CGSize(width: screenSize.width  , height: calendarView.frame.height))
        swiftUIView.view.sizeToFit()
        calendarView.addSubview(swiftUIView.view)
        swiftUIView.didMove(toParent: self)
    }
        
 
    
    
}
