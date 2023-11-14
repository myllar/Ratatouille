//
//  SettingsView.swift
//  Ratatouille
//
//  Created by oscar student on 13/11/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showGreeting = true
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                List{
                    Section(header: Text("Section 1")) {
                        
                        NavigationLink {
                            Text("Label 2")
                        } label: {
                            SettingsRowView(type:.click, title: "Redigere landområder", systemImageName: "info.circle")
                        }
                      
                        NavigationLink {
                            Text("Label 2")
                        } label: {
                            SettingsRowView(type:.click, title: "Redigere kategorier", systemImageName: "info.circle")
                        }
                        
                        NavigationLink {
                            Text("Label 2")
                        } label: {
                            SettingsRowView(type:.click, title: "Redigere ingredienser", systemImageName: "info.circle")
                        }
                    }
                    
                    
                        
                    
                    Section(header: Text("Section 2")) {
                        SettingsRowView(type: .toggle, title: "Aktiver mørk modus", systemImageName: "info.circle")
                    }
                    
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
