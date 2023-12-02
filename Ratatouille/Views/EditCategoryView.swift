//
//  EditCategoryView.swift
//  Ratatouille
//
//  Created by oscar student on 03/12/2023.
//

import SwiftUI

struct EditCategoryView: View {
    @State private var inputPlaceHolder = ""
    
    var body: some View {
        List {
            Section(header: Text("Opprette kategori")) {
//                Text("Hello")
                TextField("Søk kategori navn", text: $inputPlaceHolder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()
                Button(action: {
                    placeHolderFunction()
                }, label: {
                    Text("Opprett")
                })
            }
            .padding()
            
            Section(header: Text("Redigere kategori")) {
                TextField("Søk kategori navn", text: $inputPlaceHolder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()
                Button(action: {
                    placeHolderFunction()
                }, label: {
                    Text("Rediger")
                })
            }
            .padding()
            
            Section(header: Text("Arkiver kategori")) {
                TextField("Søk kategori navn", text: $inputPlaceHolder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()
                Button(action: {
                    placeHolderFunction()
                }, label: {
                    Text("Arkiver")
                })
            }
            .padding()
            
           
            }
        }

    
    
    
    func placeHolderFunction() {
        print("Input is: '\(inputPlaceHolder)' -- Button pressed")
        //add input to Meal context
        
    }
}

#Preview {
    EditCategoryView()
}
