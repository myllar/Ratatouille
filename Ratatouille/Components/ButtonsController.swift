////
////  Buttons.swift
////  Ratatouille
////
////  Created by oscar student on 29/11/2023.
////
//
//import Foundation
//
//
//class ButtonsController {
//    
//    var mealItems: [Favo] = []
//    
//    var setFavorite: Set<String> = Set(UserDefaults.standard.stringArray(forKey: "setFavorite") ?? [])
//    
//    func toggleFavorite(_ id: String) {
//        
//        // Load the set of favorite IDs from UserDefaults
//        if let savedFavoriteMeals = UserDefaults.standard.array(forKey: "savedFavoriteMeals") as? [String] {
//            setFavorite = Set(savedFavoriteMeals)
//        } else {
//            setFavorite = Set()
//        }
//
//        // Check if the item is already marked as a favorite
//        if setFavorite.contains(id) {
//            // Check if the item exists in the mealItems array
//            if mealItems.firstIndex(where: { $0.idMeal == id }) != nil {
//                // Item is already in favorites and exists in the mealItems array, do nothing
//                print("Item \(id) is already in favorites and exists in the mealItems array, do nothing")
//                
//            } else {
//                // Item is already in favorites but not in the mealItems array, remove it
//                setFavorite.remove(id)
//                print("// Item is already in favorites but not in the mealItems array, remove it")
//            }
//        } else {
//            // Item is not in favorites, add it
//            setFavorite.insert(id)
//
//            if let selectedMeal = mealItems.first(where: { $0.idMeal == id }) {
//                createMeal(from: selectedMeal)
//            } else {
//                print("Meal with ID \(id) not found.")
//            }
//        }
//
//        // Save the updated set of favorite IDs to UserDefaults
//        UserDefaults.standard.set(Array(setFavorite), forKey: "savedFavoriteMeals")
//    }
//    
//    
//}
