//
//  DriverPointsGoogleMapVC.swift
//  Takhawi
//
//  Created by Sara Mady on 10/10/2024.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps


class DriverPointsGoogleMapVC : BaseVC ,GMSMapViewDelegate{
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    
    //MARK: - Properties -
    var meetingLocationArray : [meetingLocationResult] = []
    var didSelectLocation:((_ : meetingLocationResult , _:Bool)->())?
    var selectedMarker:GMSMarker?
    var isDistnation = true
    var locactionsArray = [CLLocationCoordinate2D]()
    //MARK: - Creation -
    static func create() -> DriverPointsGoogleMapVC {
        let vc = DriverPointsGoogleMapVC()
        vc.hidesBottomBarWhenPushed = true
        return vc
    }
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.mapView.delegate = self
        self.addMarkers()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.addGoogleTheme()
    }
    
    
    
    func addGoogleTheme () {
        do {
            if let styleURL = Bundle.main.url(forResource: "googleMapsStyle", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
    }
    
    
    
    //MARK: - Logic Methods -
    func addMarkers() {
           for location in meetingLocationArray {
               let marker = GMSMarker()
               marker.position = CLLocationCoordinate2D(latitude: location.location?.lat ?? 0.0,
                                                        longitude: location.location?.lng ?? 0.0)
               self.locactionsArray.append(CLLocationCoordinate2D(latitude: location.location?.lat ?? 0.0,
                                                                  longitude: location.location?.lng ?? 0.0))
               marker.title = location.name
               marker.icon = UIImage(named: "meeting-point (1)")
               marker.map = mapView
               
           }
        self.showBoundBox(self.locactionsArray)
       }
    
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            // Perform action when marker is tapped
           
        if let selectedMarker = mapView.selectedMarker {
        selectedMarker.icon = UIImage(named: "meeting-point (2) 1")}

        marker.icon = UIImage(named: "redMeeting")
        mapView.selectedMarker = marker
        self.selectedMarker = marker
        
        return true // Return true to indicate that the tap has been handled
        }
    
    func showBoundBox( _ list : [CLLocationCoordinate2D]){
        
        var bounds = GMSCoordinateBounds()
        for location in list {
            bounds = bounds.includingCoordinate(location)
        }
            
        let update = GMSCameraUpdate.fit(bounds, withPadding: 100)
        mapView.animate(with: update)
        
    }

    //MARK: - Actions -
    @IBAction func backAction(_ sender: Any) {
        self.pop()
    }
    
    @IBAction func selectAction(_ sender: Any) {
        if let selectedPoint = self.meetingLocationArray.first(where:{$0.location?.lat == self.selectedMarker?.position.latitude}){
            self.didSelectLocation?(selectedPoint, self.isDistnation)
        }
        self.pop()
    }
    
}


//MARK: - Networking -
extension DriverPointsGoogleMapVC {
    
}

//MARK: - Routes -
extension DriverPointsGoogleMapVC {
    
}
