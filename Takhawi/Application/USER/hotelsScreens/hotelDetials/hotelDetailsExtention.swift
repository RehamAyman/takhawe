//
//  hotelDetailsExtention.swift
//  Takhawi
//
//  Created by Reham Ayman on 07/12/2023.
//

import UIKit
import ImageSlideshow
import GoogleMaps




extension hotelDetailsVC  : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {

    
//MARK: - IMAGE SLIDER CONFIGRATION
    func configImageSlider ( ) {
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.white
        pageIndicator.pageIndicatorTintColor = UIColor ( named:  "MainColor")
        pageIndicator.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        self.imageSliderView.pageIndicator = pageIndicator
        imageSliderView.pageIndicatorPosition = PageIndicatorPosition(vertical: .customBottom(padding: 25))

        imageSliderView.setImageInputs( [
            ImageSource(image: UIImage(named: "JW Marriott Marquis Miami") ?? UIImage()),
            ImageSource(image: UIImage(named: "hotel1") ?? UIImage()) ,
            ImageSource(image: UIImage(named: "hotel2") ?? UIImage())
        
        ])

        self.imageSliderView.zoomEnabled = true
        self.imageSliderView.slideshowInterval = 7
        self.imageSliderView.contentScaleMode = .scaleAspectFill
        
        
     
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
    
    
   
    
    //MARK: - COLLECTION VIEW METHODS
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return self.dummydate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "amenitiesCell", for: indexPath) as! amenitiesCell
        
        
        let item = self.dummydate[indexPath.row]
        cell.icon.image = UIImage(named: item.icon)
        cell.title.text = item.name
        
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
         return CGSize(width: collectionView.frame.width/3 , height: collectionView.frame.height/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    
    
    
    
    
    
//MARK: - google maps view
    
    func   setUpGoogleView () {
        let camera = GMSCameraPosition.camera(withLatitude: 10.8116326 , longitude: 106.6727548, zoom: 13)
        self.mapView.camera = camera
        do {
                    // Set the map style by passing the URL of the local file.
                    if let styleURL = Bundle.main.url(forResource: "googleMapsStyle", withExtension: "json") {
                        mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                    } else {
                        NSLog("Unable to find style.json")
                    }
                } catch {
                    NSLog("One or more of the map styles failed to load. \(error)")
                }
        
      }
    
}

