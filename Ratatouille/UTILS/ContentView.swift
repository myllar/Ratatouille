////
////  ContentView.swift
////  Ratatouille
////
////  Created by oscar student on 13/11/2023.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    
//    @Environment(\.managedObjectContext) var mealDataContext
//                    //NO SORTING
//    @FetchRequest(sortDescriptors: []) var meals: FetchedResults<Meal>
//    
//    var body: some View {
//        VStack {
//            List (meals) { meal in
//                Text(meal.strMeal ?? "No name")
//            }
//            
//            Button("Add") {
//////                let ...
////             
////                let meal = Meal(context: mealDataContext)
////                meal.idMeal
////                meal.strMeal
////                
////                try? mealDataContext.save()
//            }
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
