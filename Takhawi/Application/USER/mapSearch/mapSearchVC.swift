//
//  mapSearchVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/10/2023.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps
//import GooglePlaces
import CoreLocation
import MapKit



class mapSearchVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var googleView: GMSMapView!
    
    @IBOutlet weak var backOutlet: UIButton!
    //MARK: - Properties -
    
    let locationManager = CLLocationManager()
    var matchingItems: [MKMapItem] = [MKMapItem]()
    var delegate: sendDataBackDelegate?
    let Storeannotation = ImageAnnotation()
    let userAnnotaion = ImageAnnotation()
    var lat:Double = 0.0
    var lng:Double = 0.0
    var marker = GMSMarker()
    var titleView = ""
    var isRecive = ""
    
    
//MARK: - Creation -

    
    
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.backOutlet.setImage( UIImage(named: "Group 25")?.imageFlippedForRightToLeftLayoutDirection(), for: .normal)
       
        setMapview()
        
    }
    
//MARK: - Logic Methods -
 
    func setMapview() {
        locationManager.delegate = self
        googleView.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        self.locationLabel.isUserInteractionEnabled = true
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Vector 1"))
        imageView.center = self.view.center
      
        self.googleView?.addSubview(imageView)
        googleView.isMyLocationEnabled = false 
        
     
        
        
        do {
                    // Set the map style by passing the URL of the local file.
                    if let styleURL = Bundle.main.url(forResource: "googleMapsStyle", withExtension: "json") {
                        googleView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)

                    } else {
                        NSLog("Unable to find style.json")
                    }
                } catch {
                    NSLog("One or more of the map styles failed to load. \(error)")
                }
        
        
    }
    
//MARK: - Actions -
 
    @IBAction func confirm(_ sender: UIButton) {
        // present the calendar
        delegate?.finishPassing(location: locationLabel.text! , lat: self.lat , lng: self.lng)
        pop(animated: true )
       
        
    }
    
    @IBAction func dismiss(_ sender: Any) {
        pop(animated: true )
    }
}


//MARK: - Networking -
extension mapSearchVC {
    
    
    
    
    
}

//MARK: - Routes -
extension mapSearchVC {
    
}
