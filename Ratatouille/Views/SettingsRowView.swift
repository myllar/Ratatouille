////
////  SettingsRowView.swift
////  Ratatouille
////
////  Created by oscar student on 14/11/2023.
////
//
//import SwiftUI
//
//enum RowType {
//    case click
//    case toggle
//}
//
//struct SettingsRowView: View {
//    var type: RowType
//    var title: String
//    var systemImageName: String
//    
//    @State private var isToggleOn = false
//    
//struct ClickableRow: View {
//    var title: String
//    var systemImageName: String
//
//    var body: some View {
//        
//        HStack{
//            Image(systemName: systemImageName)
//            Text(title)
//        }
//    }
//}
//    
//struct ToggleRow: View {
//    var title: String
//    var systemImageName: String
//    @Binding var isOn: Bool
//    
//    var body: some View {
//        HStack {
//            Image(systemName: systemImageName)
//            Text(title)
//            Spacer()
//            Toggle("", isOn: $isOn)
//        }
//    }
//}
//    
//
//    
//    var body: some View {
//        switch type {
//        case .click:
//            return AnyView(ClickableRow(title: title, systemImageName: systemImageName))
//        case .toggle:
//            return AnyView(ToggleRow(title: title, systemImageName: systemImageName, isOn: $isToggleOn))
//        }
//    }
//}
//
//#Preview {
//    SettingsRowView(type: .click, title: "Test", systemImageName: "info.circle")
//}
