//
//  BottomTabView.swift
//  Ratatouille
//
//  Created by oscar student on 16/11/2023.
//

import SwiftUI

struct BottomTabView: View {
    
    
    var body: some View {
        TabView {
            
            MyFavoriteMeals()
                .tabItem { Label("Mine oppskrifter", systemImage: "takeoutbag.and.cup.and.straw")
                }
            //add icon for darkmode
            
            SearchView()
                .tabItem { Label("Søk", systemImage: "doc.text.magnifyingglass")
                }
            //add icon for darkmode
            
            ArchiveView()
                .tabItem { Label("Arkiverte", systemImage: "doc.text.magnifyingglass")
                }
            
            SettingsView()
                .tabItem { Label("Innstillinger", systemImage: "gearshape")
                }
            //add icon for darkmode
            
            
            
            EditAreaView()
                .tabItem { Label("Mine oppskrifter", systemImage: "pencil")
                }
            EditCategoryView()
                .tabItem { Label("Mine oppskrifter", systemImage: "pencil")
                }
            
            
        }
        
        
        
        .accentColor(Color("BrandPrimary"))
        .onAppear() {
            print("TabView showing")
        }
    

    }
        
}

#Preview {
    BottomTabView()
}
