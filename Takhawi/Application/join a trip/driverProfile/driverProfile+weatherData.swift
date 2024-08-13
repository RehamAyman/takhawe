//
//  driverProfile+weatherData.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/02/1446 AH.
//

import Foundation
import CoreLocation
import UIKit

extension driverProfileVC : WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.weatherLabel.text = weather.temperatureString + "°C"
            self.weatherIcon.image =  UIImage(systemName: weather.conditionName)
            self.weatherIcon.tintColor = UIColor(named: "MainColor")
            self.weatherContainerProg.isHidden = true
            self.weatherIndicator.stopAnimating()
         
        }
    }
    
    func didFailWithError(error: Error) {
        self.weatherLabel.text  = "--"
        self.weatherContainerProg.isHidden = true
        self.weatherIndicator.stopAnimating()
        print(error)
    }
}


extension driverProfileVC  : CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
