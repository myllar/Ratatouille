

import Foundation

import UIKit

// ---------------------------------------------- MEAL MODEL


// ---------------------------------------------- MEAL MODEL
struct ArchivedMealItem: Codable, Identifiable {
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
}


//    //  EDIT PRESENTATION OF INGREDIENT+MEASURE
    
//    extension MealItem {
//        func measuredIngredient() -> String {
//            return ingredient?.map {
//                "\($0.name) (\($0.measure)"
//            }.joined(separator: ", ") ?? ""
//        }
//    }
