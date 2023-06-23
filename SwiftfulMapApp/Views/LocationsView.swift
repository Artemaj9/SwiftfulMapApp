//
//  LocationsView.swift
//  SwiftfulMapApp
//
//  Created by Artem on 23.06.2023.
//

import SwiftUI
import MapKit



struct LocationsView: View {

    @EnvironmentObject private var vm: LocationsViewModel

//    @State private var mapRegion:  MKCoordinateRegion = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
//        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
             
            VStack(spacing: 0) {
           header
            .padding()
            Spacer()
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var header: some View {
        
        VStack {
        Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
            .font(.title2)
            .fontWeight(.black)
            .foregroundColor(.primary)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .overlay(alignment: .leading) {
                Image(systemName: "arrow.down")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding()
            }
        
    }
    .background(.thickMaterial)
    .cornerRadius(10)
    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
