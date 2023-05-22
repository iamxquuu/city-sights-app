//
//  ContentModel.swift
//  CitySights
//
//  Created by Marcel Maciaszek on 22/05/2023.
//

import Foundation
import CoreLocation


class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    override init() {
        
        super.init()
        locationManager.delegate = self
        
        //request permisson from the user
        locationManager.requestWhenInUseAuthorization()
        
        
        //start geolocating the user, after we get permission
        //locationManager.startUpdatingLocation()
        
    }
    
    // MARK - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            
        }
        else if locationManager.authorizationStatus == .denied {
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        // Gives us the location of the user
        print(locations.first ?? "no location")
        
        
        
        //Stop requesting the location after we get it once
        locationManager.stopUpdatingLocation()
        
    }
    
}
