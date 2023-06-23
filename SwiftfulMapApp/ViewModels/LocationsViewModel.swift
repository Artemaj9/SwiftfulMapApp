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
    @Published var locations: [Location]
    
    //Current location on map
    @Published var mapLocation: Location {
        
        didSet {
            updateMapRegion(location: mapLocation)
        }
        
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show list of location
    @Published var showLoocationsList: Bool = false
    
    //Show location detail via sheet
    @Published var sheetLocation: Location? = nil
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
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLoocationsList = !showLoocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLoocationsList = false
        }
    }

func nextButtonPressed() {
    
    //Get the current index

    
    guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
        print("Could not find index in the current array! Should never happen.")
        return
    }
    //Chek if the current index is valid
    let nextIndex = currentIndex + 1
    guard locations.indices.contains(nextIndex) else {
        //NEXT index is not valid
        //Restart from 0
        guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
        return
        }
        //Next index is
        let nextLocation = locations[nextIndex]
    showNextLocation(location: nextLocation)
    
    }
}

