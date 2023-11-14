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
            Text("hello, this is the header!")
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 100)
                .cornerRadius(25)
                .shadow(color: .black, radius: 20)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
//            ContentView()
            
            TabView {
                MyRecipesView()
//                Text("Import MyRecipesView")
                    .tabItem { Label("Mine oppskrifter", systemImage: "tray.and.arrow.up.fill") }
            
                SearchView()
                    .tabItem { Label("Søk", systemImage: "tray.and.arrow.up.fill") }
            
                SettingsView()
                    .tabItem { Label("Innstillinger", systemImage: "tray.and.arrow.up.fill") }
            }
        }
    }
}
