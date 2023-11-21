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

// ---------------------------------------------------------------------------------

import SwiftUI


// ---------------------------------------------- MEAL MODEL

import UIKit



// ---------------------------------------------- MEAL MODEL


// ---------------------------------------------- MEAL MODEL
struct MealItem: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strArea: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
//    let strIngredient: String?
//    let strMeasure: String?
    
//    let ingredient: [(name: String, measure: String)]?
    
    
    //  ENABLE IDENTIFIABLE
    var id: String { idMeal}
//    let idMeal = UUID()
    
    
    // POSSIBLE TO SHORTHAND? ..."strIngredient\($)"
    //              "...+index"
    
    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strArea
        case strCategory
        case strInstructions
        case strMealThumb
//        case strIngredient
//        case strMeasure
        
//        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
//        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    
    //  SHORTHAND?
    
    init(from mealItemDecoder: Decoder) throws {
        let mealItemContainer = try mealItemDecoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try mealItemContainer.decode(String.self, forKey: .idMeal)
        strMeal = try mealItemContainer.decode(String.self, forKey: .strMeal)
        strArea = try mealItemContainer.decode(String.self, forKey: .strArea)
        strCategory = try mealItemContainer.decode(String.self, forKey: .strCategory)
        strInstructions = try mealItemContainer.decode(String.self, forKey: .strInstructions)
        strMealThumb = try mealItemContainer.decode(String.self, forKey: .strMealThumb)
        
//        strIngredient = try mealItemContainer.decode(String.self, forKey: .strIngredient)
//        strMeasure = try mealItemContainer.decode(String.self, forKey: .strMeasure)
        
        
//        ingredient = (1...20).compactMap { index in guard
//            let name = try? mealItemContainer.decodeIfPresent(String.self, forKey: CodingKeys(rawValue: "strIngredient\(index)")!),
//            let measure = try? mealItemContainer.decodeIfPresent(String.self, forKey: CodingKeys(rawValue: "strMeasure\(index)")!),
//            !name.isEmpty, !measure.isEmpty
//            else {
//            return nil
//        }
//            return (name, measure)
//        }
    }
}


    //  EDIT PRESENTATION OF INGREDIENT+MEASURE
    
//    extension MealItem {
//        func measuredIngredient() -> String {
//            return ingredient?.map {
//                "\($0.name) (\($0.measure)"
//            }.joined(separator: ", ") ?? ""
//        }
//    }


// ---------------------------------------------- END OF MEAL MODEL
    
// ---------------------------------------------- MEAL API


struct APIController {
    static func getAllMeals(completion: @escaping ([MealItem]) -> Void){
        let apiURL = URL(string: 
//        "https://www.themealdb.com/api/json/v1/1/search.php?s=Cajun")!
        "https://www.themealdb.com/api/json/v1/1/search.php?s=")!
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: apiURL)
                //                print("API Response Data: \(String(data: data, encoding: .utf8) ?? "No data")")
                
                let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                //                print("Decoded Meals: \(mealResponse.meals)")
                
                completion(mealResponse.meals)
                
            }catch{
                //                print("Error decoding API response: \(error)")
                completion([])
            }
        }
    }
    
    private struct MealResponse: Decodable {
        let meals: [MealItem]
    }
}


// ---------------------------------------------- END OF MEAL API
    
// ---------------------------------------------- UI VIEW
    
//import SwiftUI

struct SearchView: View {
    
    @State private var mealItems: [MealItem] = []
    @State private var searchText: String = ""
    @State private var selectCategory: String = ""
    
//  SET AND CACHE FAVORITES
    @State private var setFavorite: Set<String> = Set(UserDefaults.standard.stringArray(forKey: "setFavorite") ?? [])
    
    
    
//          FILTERED MEALS VIEW
    var loadFilteredMeals: [MealItem] {
        if searchText.isEmpty && selectCategory.isEmpty {
            return mealItems
        } else if !searchText.isEmpty {
            return mealItems.filter { mealItem in
                mealItem.strMeal
                    .localizedCaseInsensitiveContains(searchText)
            }
        }else {
            return mealItems.filter { mealItem in
                mealItem.strCategory == selectCategory
            }
        }
    }
    
//          ADD FILTER SEARCH
    
//          FILTER BY CATEGORY
    var filterCategory: [String] {
        Array(Set(mealItems.map(\.strCategory)))
    }
    
    
    
    var body: some View {
        
        NavigationStack {
            HStack{
                TextField("Search meal by name", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Picker("Filtrer på kategori", selection: $selectCategory) {
                Text("Alle").tag("")
                ForEach(filterCategory, id: \.self) {
                    category in Text(category).tag(category)
                }
            }
            
            VStack{
                List (loadFilteredMeals, id: \.idMeal) { MealItem in
                    VStack (alignment: .leading) {
                        NavigationLink {
                            
//       DETAILED VIEW
                            
//       ADD FAVORITE BUTTON
                            Button(action: {
                                toggleFavorite(MealItem.idMeal)
                            }) {
                                if setFavorite.contains(MealItem.idMeal) {
                                    Image(systemName: "star.fill")
                                } else {
                                    Image(systemName: "star")
                                }
                            }

                            VStack {
                                Text("Name: \(MealItem.strMeal)")
                                                                
                                if let mealImageURL = URL(string: MealItem.strMealThumb) {
                                    AsyncImage(url: mealImageURL) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(100)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(100)
                                        case .empty:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(100)
                                        }
                                    }
                                }
                                Text("Area: \(MealItem.strArea)")
                                Text("Category: \(MealItem.strCategory)")
                                Text("You need: ")
//                                Text("\(MealItem.strIngredient) : \(MealItem.strMeasure)")
//                                Text("\(MealItem.measuredIngredient())")
                            }
                            Spacer()
                                                        
                        } label: {
//       PREVIEW VIEW
                            VStack {
                                HStack {
                                    if let mealImageURL = URL(string: MealItem.strMealThumb) {
                                        AsyncImage(url: mealImageURL) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(100)
                                            case .failure:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(100)
                                            case .empty:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(100)
                                            }
                                        }
                                    }
                                    Text("Name: \(MealItem.strMeal)")
                                    Text("Area: \(MealItem.strArea)")
                                    Text("Category: \(MealItem.strCategory)")
                                }
                                
                                Button(action: {
                                    toggleFavorite(MealItem.idMeal)
                                }) {
                                    if setFavorite.contains(MealItem.idMeal) {
                                        Image(systemName: "star.fill")
                                    } else {
                                        Image(systemName: "star")
                                    }
                                }
                            }
                        }
                        .foregroundColor(.brandPrimary)
                    }
                }
            }
            .navigationTitle("Søk")
        }
        .onAppear {
            loadMealItems()
        }
    }

    
    
    func loadMealItems() {
        APIController.getAllMeals { loadedMealItems in DispatchQueue.main.async {
            self.mealItems = loadedMealItems
        }
    }
}
    
//          ADD TOGGLE FAVORITE
    
    func toggleFavorite(_ id: String) {
        if setFavorite.contains(id) {
            setFavorite.remove(id)
        }else {
            setFavorite.insert(id)
        }
        UserDefaults.standard.set(Array(setFavorite), forKey: "savedFavoriteMeals")
    }
}


#Preview {
    SearchView()
}

