//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Artem on 23.06.2023.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
