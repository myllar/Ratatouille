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
        WindowGroup {
            Image("HERO_main")
            ZStack{
                BottomTabView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
        }
    }
}

//#Preview {
//    ArchiveView()
//}
