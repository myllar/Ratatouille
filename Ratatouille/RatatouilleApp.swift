//
//  RatatouilleApp.swift
//  Ratatouille
//
//  Created by oscar student on 13/11/2023.
//

import SwiftUI

@main
struct RatatouilleApp: App {
    var body: some Scene {
        WindowGroup {
            Text("hello, this is the header! Image coming soon")
            Text("hello, this is the header! Image coming soon")
            Text("hello, this is the header! Image coming soon")

            
            TabView {
                
                SearchView()
                    .tabItem { Label("Søk", systemImage: "tray.and.arrow.up.fill") }


                MyRecipesView()
//                Text("Import MyRecipesView")
                    .tabItem { Label("Mine oppskrifter", systemImage: "tray.and.arrow.up.fill") }
            
                SettingsView()
                    .tabItem { Label("Innstillinger", systemImage: "tray.and.arrow.up.fill") }
            }
        }
    }
}
