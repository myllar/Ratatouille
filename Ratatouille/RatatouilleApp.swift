//
//  RatatouilleApp.swift
//  Ratatouille
//
//  Created by oscar student on 13/11/2023.
//

import SwiftUI

@main
struct RatatouilleApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false

    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        
// ADD CHECK FOR DARKMODE = TRUE
        
        WindowGroup {
            ZStack{
                Text("hello, this is the header! HEROImage coming soon")
                Text("hello, this is the header! HEROImage coming soon")
                Text("hello, this is the header! HEROImage coming soon")
            
                BottomTabView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                
            }
            
        }
    }
}

