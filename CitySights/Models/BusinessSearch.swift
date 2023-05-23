//
//  BusinessSearch.swift
//  CitySights
//
//  Created by Marcel Maciaszek on 23/05/2023.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
