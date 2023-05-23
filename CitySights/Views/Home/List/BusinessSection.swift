//
//  BusinessSection.swift
//  CitySights
//
//  Created by Marcel Maciaszek on 23/05/2023.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        
        Section(header: BusinessSectionHeader(title: title)) {
            ForEach(businesses) { business in
                Text(business.name ?? "")
                Divider()
            }
        }
    }
}
