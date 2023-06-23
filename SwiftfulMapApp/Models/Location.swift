//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by Artem on 23.06.2023.
//

import Foundation
import MapKit
struct Location: Identifiable {
    
//    let id: String = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        //name = "Colosseum
        //cityName = "Rome"
        //id = "ColoseumRome"
        name + cityName
    }
}


