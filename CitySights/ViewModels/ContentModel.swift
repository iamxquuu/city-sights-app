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
    
    // MARK: - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        // Gives us the location of the user
        let userLocation = locations.first
        
        if userLocation != nil {
            
            //Stop requesting the location after we get it once
            locationManager.stopUpdatingLocation()
            
            //getBusinesses(category: "arts", location: userLocation!)
            getBusinesses(category: "restaurants", location: userLocation!)
        }
    }
    // MARK: - Yelp API methods
    func getBusinesses(category:String, location:CLLocation) {

        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6"),
        ]
        
        let url = urlComponents?.url
        
        if let url = url {
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer yR9id465JCQwWPNj0JdaP3DfQX0AwBMVcJxXKdXDnIZ_5_G2RtFOc1pUCTdpZw7OJDYEDzDkwgtptWgGPbnxECXGaLde02Uv_c1-QxEJU5sdGTppxnGXL6s2ZohrZHYx", forHTTPHeaderField: "Authorization")
           
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    print(response)
                }
                
            }
            dataTask.resume()
            
        }
        
        
        
    }
}
