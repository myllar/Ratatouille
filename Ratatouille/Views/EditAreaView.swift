//
//  EditArea.swift
//  Ratatouille
//
//  Created by oscar student on 02/12/2023.
//

import SwiftUI

struct EditAreaView: View {
    
    @State private var inputPlaceHolder = ""
    
    var body: some View {
        List {
            Section(header: Text("Opprette landområder")) {
//                Text("Hello")
                TextField("Søk matrett navn", text: $inputPlaceHolder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()
                Button(action: {
                    placeHolderFunction()
                }, label: {
                    Text("Opprett")
                })
            }
            .padding()
            
            Section(header: Text("Redigere landområder")) {
                TextField("Søk matrett navn", text: $inputPlaceHolder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()
                Button(action: {
                    placeHolderFunction()
                }, label: {
                    Text("Rediger")
                })
            }
            .padding()
            
            Section(header: Text("Arkiver landområder")) {
                TextField("Søk matrett navn", text: $inputPlaceHolder)
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
    EditAreaView()
}

















//USE TO FILTER
//VStack(alignment: .leading){
//    List (mealItems, id: \.idMeal) { mealItems in
//        VStack (alignment: .leading) {
//            Text(mealItems.strMeal)
//        }
//    }
//}
