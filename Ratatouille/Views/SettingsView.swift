//
//  SettingsView.swift
//  Ratatouille
//
//  Created by oscar student on 13/11/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                List{
//Section 1
                    Section(header: Text("Redigere databasen (Endre innhold)")) {
                                                
                        NavigationLink {
                            Text("siden form å Redigere landområder")
                        } label: {
                            HStack{
                                Image(systemName: "pencil")
                                Text("Redigere landområder")
                            }
                        }
                            
                        NavigationLink {
                            Text("siden form å Redigere kategorier")
                        } label: {
                            HStack{
                                Image(systemName: "pencil")
                                Text("Redigere kategorier")
                            }
                        }
                            
                        NavigationLink {
                            Text("siden form å Redigere ingredienser")
//                         e.g.   SearchView()
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
                        Text("siden form å Administrere arkiv")
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
