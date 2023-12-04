//
//  BottomTabView.swift
//  Ratatouille
//
//  Created by oscar student on 16/11/2023.
//

import SwiftUI

struct BottomTabView: View {
    
    
    var body: some View {
        
        VStack{
//            VStack {
            Image("image_titleImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(height: 80)
//                }
            
            
            TabView {
                
                
//                ArchiveView()
//                    .tabItem { Label("Arkiverte", systemImage: "doc.text.magnifyingglass")
//                    }
                
                EditIngredientView()
                    .tabItem { Label("Mine oppskrifter", systemImage: "pencil")
                    }

                
                
                
                MyFavoriteMeals()
                    .tabItem { Label("Mine oppskrifter", systemImage: "takeoutbag.and.cup.and.straw")
                    }
                //add icon for darkmode
                
                SearchView()
                    .tabItem { Label("Søk", systemImage: "doc.text.magnifyingglass")
                    }
                //add icon for darkmode

                
                SettingsView()
                    .tabItem { Label("Innstillinger", systemImage: "gearshape")
                    }
                //add icon for darkmode
                
                
                

                
                
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
