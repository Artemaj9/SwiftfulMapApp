//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Artem on 23.06.2023.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    //All loaded locations
    @Published var locations: [Location] {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    
    //Current location on map
    @Published var mapLocation: Location
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
}
