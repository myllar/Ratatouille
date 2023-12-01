//
//  RatatouilleApp.swift
//  Ratatouille
//
//  Created by oscar student on 13/11/2023.
//

import SwiftUI

@main
struct RatatouilleApp: App {
    
//    @AppStorage("isDarkMode") private var isDarkMode = false

//    @Environment(\.colorScheme) var isDarkMode
    
//    @StateObject var userSettings = SettingsView()
    
    @StateObject private var dataController = DataController()
    
    @AppStorage("isDarkMode") public var isDarkMode = true
    
    
    var body: some Scene {
        
        WindowGroup {
            
            VStack {
                //                Image("HERO_main")
                BottomTabView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
//            check local storage for selected colorscheme (from settingsView):
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        
    }
}


#Preview {
    ArchiveView()
}
