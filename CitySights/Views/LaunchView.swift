//
//  ContentView.swift
//  CitySights
//
//  Created by Marcel Maciaszek on 22/05/2023.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.authorizationState == .notDetermined{
            
            
        }else if model.authorizationState == CLAuthorizationStatus.authorizedAlways || model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse{
            
            //home view
            HomeView()
            
        }else{
            
            //deniedview
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
