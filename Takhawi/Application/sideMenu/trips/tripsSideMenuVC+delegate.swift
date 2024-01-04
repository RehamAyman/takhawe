//
//  tripsSideMenuVC+delegate.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//

import UIKit


extension tripsSideMenuVC {
    func setupsegment ( ) {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
             segment.setTitleTextAttributes(titleTextAttributes, for:.normal)
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segment.setTitleTextAttributes(titleTextAttributes1 as [NSAttributedString.Key : Any], for:.selected)
        segment.selectedSegmentTintColor = UIColor(named: "MainColor")
        segment.backgroundColor = UIColor(named: "secFavSeg")
       
       
        self.segment.setTitle(  "Upcoming".localize , forSegmentAt: 0)
        self.segment.setTitle(  "Completed".localize , forSegmentAt: 1)
        self.segment.setTitle(  "Cancelled".localize , forSegmentAt: 2)
        
    }
}
