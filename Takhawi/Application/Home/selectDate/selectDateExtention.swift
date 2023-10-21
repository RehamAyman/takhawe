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
        swiftUIView.view.frame = calendarView.bounds
        swiftUIView.view.sizeToFit()
        calendarView.addSubview(swiftUIView.view)
        swiftUIView.didMove(toParent: self)
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
       {
           let touch = touches.first
           if touch?.view != self.mainView
           { self.dismiss(animated: true, completion: nil) }
       }
    
    
}
