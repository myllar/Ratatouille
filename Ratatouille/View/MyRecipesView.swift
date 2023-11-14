//
//  MyRecipesView.swift
//  Ratatouille
//
//  Created by oscar student on 13/11/2023.
//

import SwiftUI

struct MyRecipesView: View {
    var body: some View {
        
        VStack {
            Text("Hello, from MyRecipes!")
            .aspectRatio(contentMode: .fill)
            .frame(width: 350, height: 180)
            .cornerRadius(25)
            .shadow(color: .black, radius: 20)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    MyRecipesView()

}
