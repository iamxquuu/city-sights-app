//
//  HomeView.swift
//  CitySights
//
//  Created by Marcel Maciaszek on 23/05/2023.
//

import SwiftUI



struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            // list or map
            
            NavigationView {
                if !isMapShowing {
                    //show list
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Text("Switch to map view")
                        }
                        
                        Divider()
                        
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }else{
                    //show map
                }
            }
            
        }else{
            // still waiting for data
            ProgressView()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
