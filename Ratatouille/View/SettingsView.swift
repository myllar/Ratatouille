//
//  SettingsView.swift
//  Ratatouille
//
//  Created by oscar student on 13/11/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        
        NavigationView {
            VStack {
                List{
                    Section(header: Text("Section 1")) {
                        SettingsRowView(title: "Redigere landområder", systemImageName: "info.circle")
                        SettingsRowView(title: "Redigere kategorier", systemImageName: "info.circle")
                        
                        SettingsRowView(title: "Redigere ingredienser", systemImageName: "info.circle")
                    }
                    
                    Section(header: Text("Section 2")) {
                        SettingsRowView(title: "Aktiver mørk modus", systemImageName: "info.circle")
                    }
                    
                    Section(header: Text("Section 3")) {
                        SettingsRowView(title: "Administrere arkiv", systemImageName: "info.circle")
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
