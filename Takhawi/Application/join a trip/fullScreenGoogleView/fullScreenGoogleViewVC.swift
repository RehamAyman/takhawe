//
//  fullScreenGoogleViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 01/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps

class fullScreenGoogleViewVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
    @IBOutlet var GoogleView: GMSMapView!
    //MARK: - Properties -
    
    var animatePolyline: AnimatePolyline?

// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.setUpGoogleView()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    
//MARK: - Logic Methods -
    func   setUpGoogleView () {
        let camera = GMSCameraPosition.camera(withLatitude: 10.8116326 , longitude: 106.6727548, zoom: 17.5)
        self.GoogleView.camera = camera
        
        Utilities.findRouteOnMap(
            pickup: CLLocationCoordinate2D(latitude: 10.8116326, longitude: 106.6727548),
            destination: CLLocationCoordinate2D(latitude: 10.7721148, longitude: 106.6960897)) { [weak self] route in
                guard let route = route else { return }
                self?.makeAnimatePolyline(route: route)
            }
        
        do {
                    // Set the map style by passing the URL of the local file.
                    if let styleURL = Bundle.main.url(forResource: "googleMapsStyle", withExtension: "json") {
                        GoogleView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)

                    } else {
                        NSLog("Unable to find style.json")
                    }
                } catch {
                    NSLog("One or more of the map styles failed to load. \(error)")
                }
        
      }
      
      private func makeAnimatePolyline(route: [CLLocationCoordinate2D]) {
            self.animatePolyline = AnimatePolyline(mapView: self.GoogleView)
            self.animatePolyline?.route = route
            self.animatePolyline?.startAnimation()

            GoogleView.animate(with: GMSCameraUpdate.fit(GMSCoordinateBounds(path: route.path), withPadding: 50.0))
        }
    
//MARK: - Actions -
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true )
    }
}


//MARK: - Networking -
extension fullScreenGoogleViewVC {
    
}

//MARK: - Routes -
extension fullScreenGoogleViewVC {
    
}
