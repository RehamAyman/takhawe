//
//  mapSearchVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/10/2023.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import MapKit

class mapSearchVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var googleView: GMSMapView!
    
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
        googleView.isMyLocationEnabled = true
     
        
        
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
        let vc = selectDateVC()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overFullScreen
        vc.onCommit =  {
            let vc = tripListVC()
            self.push(vc)
        }
        self.present(vc, animated: true )
        
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
