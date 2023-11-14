//
//  SettingsRowView.swift
//  Ratatouille
//
//  Created by oscar student on 14/11/2023.
//

import SwiftUI

struct SettingsRowView: View {
    var title: String
    var systemImageName: String
    
    var body: some View {
        HStack{
            Image(systemName: systemImageName)
            Text(title)
        }
        
    }
}

#Preview {
    SettingsRowView(title: "Test", systemImageName: "info.circle")
}
