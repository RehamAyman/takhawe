//
//  LocationExtetioin.swift
//  Marsol Awamer
//
//  Created by abdullah tarek on 16/11/2021.
//

import Alamofire
import CoreLocation
import Foundation

func getAddressFromLatLon(withLatitude: String, withLongitude: String, completion: @escaping (String?, Error?) -> Void) {
    var geocoder = CLGeocoder()
    print("-> Finding user address...")

    var center: CLLocationCoordinate2D = CLLocationCoordinate2D()
    let lat: Double = Double("\(withLatitude)") ?? 0.0
    let lon: Double = Double("\(withLongitude)") ?? 0.0
    center.latitude = lat
    center.longitude = lon

    let location: CLLocation = CLLocation(latitude: center.latitude, longitude: center.longitude)

    geocoder.reverseGeocodeLocation(location,
                                    preferredLocale: Locale(identifier: Language.isRTL() ? "ar" : "en"),
                                    completionHandler: { placemarks, error in
                                        var placemark: CLPlacemark!
                                        var addressString: String = ""

                                        if error == nil && placemarks?.count ?? 0 > 0 {
                                            placemark = placemarks![0] as CLPlacemark

                                            if placemark.isoCountryCode == "TW" /* Address Format in Chinese */ {
                                                if placemark.country != nil {
                                                    addressString = placemark.country ?? ""
                                                }
                                                if placemark.subAdministrativeArea != nil {
                                                    addressString = addressString + (placemark.subAdministrativeArea ?? "") + ", "
                                                }
                                                if placemark.postalCode != nil {
                                                    addressString = addressString + (placemark.postalCode ?? "") + " "
                                                }
                                                if placemark.locality != nil {
                                                    addressString = addressString + (placemark.locality ?? "")
                                                }
                                                if placemark.thoroughfare != nil {
                                                    addressString = addressString + (placemark.thoroughfare ?? "")
                                                }
                                                if placemark.subThoroughfare != nil {
                                                    addressString = addressString + (placemark.subThoroughfare ?? "")
                                                }
                                            } else {
                                                if placemark.subThoroughfare != nil {
                                                    addressString = placemark.subThoroughfare ?? "" + " "
                                                }
                                                if placemark.thoroughfare != nil {
                                                    addressString = addressString + (placemark.thoroughfare ?? "") + ", "
                                                }
                                                if placemark.postalCode != nil {
                                                    addressString = addressString + (placemark.postalCode ?? "") + " "
                                                }
                                                if placemark.locality != nil {
                                                    addressString = addressString + (placemark.locality ?? "") + ", "
                                                }
                                                if placemark.administrativeArea != nil {
                                                    addressString = addressString + (placemark.administrativeArea ?? "") + " "
                                                }
                                                if placemark.country != nil {
                                                    addressString = addressString + (placemark.country ?? "")
                                                }
                                            }

                                            completion(addressString, nil)
                                            print(addressString)
                                        }
                                    })
}

enum AddressFilter {
    case country, administrativeArea, locality
}

func getAddressFromLocation(lat: String, long: String, target: [AddressFilter]? = [.country, .administrativeArea, .locality], completion: @escaping (String?, Error?) -> Void) {
    let geocoder = CLGeocoder()
    print("-> Finding user address...")

    var center: CLLocationCoordinate2D = CLLocationCoordinate2D()
    let lat: Double = Double("\(lat)") ?? 0.0
    let lon: Double = Double("\(long)") ?? 0.0
    center.latitude = lat
    center.longitude = lon

    let location: CLLocation = CLLocation(latitude: center.latitude, longitude: center.longitude)

    geocoder.reverseGeocodeLocation(location,
                                    preferredLocale: Locale(identifier: Language.isRTL() ? "ar" : "en"),
                                    completionHandler: { placemarks, error in

                                        var placemark: CLPlacemark!
                                        var addressString: String = ""

                                        if error == nil && placemarks?.count ?? 0 > 0 {
                                            placemark = placemarks![0] as CLPlacemark

                                            for item in target ?? [] {
                                                switch item {
                                                case .country:
                                                    if placemark.country != nil {
                                                        addressString = addressString + (placemark.country ?? "") + " "
                                                    }

                                                case .administrativeArea:
                                                    if placemark.administrativeArea != nil {
                                                        addressString = addressString + (placemark.administrativeArea ?? "") + " "
                                                    }

                                                case .locality:
                                                    if placemark.locality != nil {
                                                        addressString = addressString + (placemark.locality ?? "") + " "
                                                    }
                                                }
                                            }

                                            completion(addressString, nil)
                                            print(addressString)
                                        }
                                    })
}
