//
//  BusinessDetail.swift
//  CitySights
//
//  Created by Marcel Maciaszek on 24/05/2023.
//

import SwiftUI

struct BusinessDetail: View {
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 0){
                
                GeometryReader() { geometry in
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all, edges: .top)
            }
           
            
            
            
            ZStack(alignment: .leading){
                Rectangle()
                    .frame(height:36)
                    .foregroundColor(business.isClosed! ? .gray : .blue)
                
                Text(business.isClosed! ? "Closed" : "Closed")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.leading)
            }
            
            Group {
                //Business Name
                Text(business.name!)
                    .font(.largeTitle)
                    .padding()
                //address
                if business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                        Text(displayLine)
                            .padding(.horizontal)
                    }
                }
                
                //rating
                Image("regolar_\(business.rating ?? 0 )")
                    .padding()
                Divider()
                //phone
                HStack{
                    Text("Phone:")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding()
                Divider()
                //reviews
                HStack{
                    Text("Reviews:")
                        .bold()
                    Text(String(business.reviewCount ?? 0))
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                Divider()
                //website
                HStack{
                    Text("Website:")
                        .bold()
                    Text(business.url ?? "")
                        .lineLimit(1)
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                Divider()
            }
            
            Button {
                //TODO:
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()

            
        }
        
        
    }
}
