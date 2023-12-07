//
//  hotelDetailsExtention.swift
//  Takhawi
//
//  Created by Reham Ayman on 07/12/2023.
//

import UIKit
import ImageSlideshow




extension hotelDetailsVC {
    
    
    func configImageSlider ( ) {
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.white
        pageIndicator.pageIndicatorTintColor = UIColor ( named:  "MainColor")
        self.imageSliderView.pageIndicator = pageIndicator
        
        
        imageSliderView.setImageInputs( [
            ImageSource(image: UIImage(named: "JW Marriott Marquis Miami") ?? UIImage()),
            ImageSource(image: UIImage(named: "hotel1") ?? UIImage()) ,
            ImageSource(image: UIImage(named: "hotel2") ?? UIImage())
        
        ])
        
        
        
        self.imageSliderView.zoomEnabled = true
        self.imageSliderView.slideshowInterval = 7
        self.imageSliderView.contentScaleMode = .scaleAspectFill
        
      
       
        
//        imageSliderView.pageIndicator = LabelPageIndicator()
//        imageSliderView.pageIndicatorPosition = PageIndicatorPosition(horizontal: .left(padding: 20), vertical: .bottom  )
        
     
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
        imageSliderView.addGestureRecognizer(gestureRecognizer)
        
        
//        slideshow.setImageInputs([
//          ImageSource(image: UIImage(named: "myImage"))!,
//          ImageSource(image: UIImage(named: "myImage2"))!,
//          AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080"),
//          KingfisherSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080"),
//          ParseSource(file: PFFile(name:"image.jpg", data:data))
//        ])
        
    }
    
    
    
    
    
    @objc func didTap() {
        imageSliderView.presentFullScreenController(from: self)
    }
    
}

