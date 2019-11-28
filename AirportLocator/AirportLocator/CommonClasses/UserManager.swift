//
//  UserManager.swift
//  AirportLocator
//
//  Created by admin on 28/11/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreLocation

class UserManager: NSObject,CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    static let shared: UserManager = UserManager()
    
    var completionHandler: ((_ isSuccess: Bool) -> ())!

    func generateNearByAirporsURL() -> String {
        guard let currentLocation = UserManager.shared.locationManager.location else{
            return ""
        }
        let userLat = String(format: "%f", currentLocation.coordinate.latitude)
        let userLng = String(format: "%f", currentLocation.coordinate.longitude)
        return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + userLat + "," + userLng + "&radius=100000&keyword=airport&key=" + Constants.apiKey
    }
    
    func isLocationServiceEnabled(completionHandler: @escaping (_ success:Bool)->()) {
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        self.completionHandler = completionHandler
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == .authorizedAlways || status == .authorizedWhenInUse){
            self.completionHandler(true)
        }else if(status == .denied){
            self.completionHandler(false)
        }
    }
}
