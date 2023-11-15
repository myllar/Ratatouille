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
                    Section(header: Text("Redigere database")) {
                        
//                        NavigationLink {
//                            Text("Label 2")
//                        } label: {
//                            SettingsRowView(type:.click, title: "Redigere landområder", systemImageName: "info.circle")
//                        }
//                    Section(header: Text("Section 2")) {
//                        SettingsRowView(type: .toggle, title: "Aktiver mørk modus", systemImageName: isDarkMode ? "moon.circle" : "moon.circle.fill")
//                            .preferredColorScheme(isDarkMode ? .dark : .light)
//                        }
//SettingsRowView(type: .toggle, title: "Aktiver mørk modus", systemImageName: isDarkMode ? "moon.circle" : "moon.circle.fill")
//.preferredColorScheme(isDarkMode ? .dark : .light)
                        
                        
                        NavigationLink {
                            Text("Redigere landområder")
                        } label: {
                            HStack{
                                Image(systemName: "info.circle")
                                Text("Redigere landområder")
                            }
                        }
                            
                        NavigationLink {
                            Text("Redigere kategorier")
                        } label: {
                            HStack{
                                Image(systemName: "info.circle")
                                Text("Redigere kategorier")
                            }
                        }
                            
                        NavigationLink {
                            Text("Redigere ingredienser")
                        } label: {
                            HStack{
                                Image(systemName: "info.circle")
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
                        SettingsRowView(type:.click, title: "Administrere arkiv", systemImageName: "info.circle")
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
