//
//  Locator.swift
//  WritingService
//
//  Created by Sara Mady on 12/03/2023.
//

import Foundation
import CoreLocation

protocol LocatorDelegate: AnyObject {
    func didUpdateLocation(lat: Double, lon: Double)
    func showLocationError(message: String)
}

class LocationManager: NSObject {

    // MARK: - Properties
    private weak var delegate: LocatorDelegate?
    private var locationManager = CLLocationManager()
    private var currentLocation: CLLocationCoordinate2D? {
        didSet {
            if let lat = self.currentLocation?.latitude, let long = self.currentLocation?.longitude {
                delegate?.didUpdateLocation(lat: Double(lat), lon: Double(long))
                self.delegate = nil
            }
        }
    }

    // MARK: - Init

    init(delegate: LocatorDelegate) {
        super.init()
        self.delegate = delegate

        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
    }

    // MARK: - Helper Functions

    private func checkLocationAuthorization() {

        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        case .denied:
            self.delegate?.showLocationError(message: LocationErrors.denied.message)
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            self.delegate?.showLocationError(message: LocationErrors.restricted.message)
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        @unknown default:
            break
        }
    }

    // MARK: - Enum Errors

    private enum LocationErrors {
        case notEnabled
        case denied
        case restricted

        var message: String {
            switch self {
            case .notEnabled:
                return "Please Enable GPS Service From Setting".localized
            case .denied:
                return "Please enable the app to access your location".localized
            case .restricted:
                return "The app is restricted from access your location".localized
            }
        }
    }
}

// MARK: - CLLocationManagerDelegate -

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard locations.first != nil else {
            return
        }
        if let lat = locationManager.location?.coordinate.latitude, let lon = locationManager.location?.coordinate.longitude {
            self.currentLocation = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        }
        locationManager.stopUpdatingLocation()

    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            self.delegate?.showLocationError(message: LocationErrors.restricted.message)
        case .denied:
            self.delegate?.showLocationError(message: LocationErrors.denied.message)
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }

    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
            // Location updates are not authorized.
            locationManager.stopUpdatingLocation()
            print(error.localizedDescription)
        }
    }
}
