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

            
            SearchView()
                .tabItem { Label("Søk", systemImage: "doc.text.magnifyingglass") }
            //add icon for darkmode
            
            
            
//            MealListView()
            MyFavoriteMeals()
            //                Text("Import MyRecipesView")
                .tabItem { Label("Mine oppskrifter", systemImage: "takeoutbag.and.cup.and.straw") }
            //add icon for darkmode
            
            
            ArchiveView()
                .tabItem { Label("Arkiverte", systemImage: "doc.text.magnifyingglass") }
            
            

            
            
            


            
    
            
            



//            ContentView()
//                .tabItem { Label("contentView test", systemImage: "takeoutbag.and.cup.and.straw") }
            
            
            
            

            
            

            
            

            
//                MyRecipesView()
            
            
            
                //                Text("Import MyRecipesView")
//                    .tabItem { Label("Mine oppskrifter", systemImage: "takeoutbag.and.cup.and.straw") }
                //add icon for darkmode
                


                SettingsView()
                    .tabItem { Label("Innstillinger", systemImage: "gearshape") }
                //add icon for darkmode
                }
        .accentColor(Color("BrandPrimary"))
    }
        
}

#Preview {
    BottomTabView()
}
