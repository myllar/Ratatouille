//
//  SettingsView.swift
//  Ratatouille
//
//  Created by oscar student on 13/11/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") public var isDarkMode = true
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                List{
                    //Section 1
                    Section(header: Text("Redigere databasen (Endre innhold)")) {
                        
                        NavigationLink {
                            EditAreaView()
                        } label: {
                            HStack{
                                Image(systemName: "pencil")
                                Text("Redigere landområder")
                            }
                        }
                        
                        
                        NavigationLink {
                            EditAreaView()
                        } label: {
                            HStack{
                                Image(systemName: "pencil")
                                Text("Redigere kategorier")
                            }
                        }
                        
                        
                        NavigationLink {
                            EditIngredientView()
                        } label: {
                            HStack{
                                Image(systemName: "pencil")
                                Text("Redigere ingredienser")
                            }
                        }
                    }
                    
                    
                    //Section 2
                    Section(header: Text("System-instillinger")) {
                        Toggle(isOn: $isDarkMode, label: {
                            HStack{
                                Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                                Text("Aktiver mørk modus")
                            }
                            .preferredColorScheme(isDarkMode ? .dark : .light)
                        })
                    }
                    
                    
                    //Section 3
                    Section(header: Text("Section 3")) {
                        NavigationLink {
                            ArchiveView()
                        } label: {
                            HStack{
                                Image(systemName: "info.circle")
                                Text("Administrere arkiv")
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
            .navigationTitle("Innstillinger")
        }
    }
    
    
}
#Preview {
    SettingsView()
}
