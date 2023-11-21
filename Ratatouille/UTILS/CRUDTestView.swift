////
////  SearchView.swift
////  Ratatouille
////
////  Created by oscar student on 13/11/2023.
////
//
//import SwiftUI
//
//struct SearchView: View {
//
//    let meals = ["Taco", "Ice", "Tagliatelle", "Spaghetti"]
//
//
////    let meals = ["www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata"]
//
//
//    @State private var searchText = ""
//
//    var body: some View {
//
//        NavigationStack {
//            List () {
//
//                ForEach(searchedMeal, id: \.self) {
//                    meal in NavigationLink {
//                        Text(meal)
//                    }label: {
//                        Text(meal)
//                    }
//                }
//            }
//            .navigationTitle("Søk")
//        }
//
//        .searchable(text: $searchText) {
//            ForEach(searchedMeal, id: \.self) { result in
//            Text("do you long for \(result)?").searchCompletion(result)
//        }
//    }
//    }
//    var searchedMeal: [String] {
//        if searchText.isEmpty {
//            return meals
//        }else {
//            return meals.filter { $0.contains(searchText) }
//        }
//    }
//}
//
//
//
//
//#Preview {
//    SearchView()
//}
