    //import Foundation
    //import UIKit
    //
    //
    //struct ArchivedMealItem: Codable, Identifiable {
    //    let idMeal: String
    //    let strMeal: String
    //    let strArea: String
    //    let strCategory: String
    //    let strInstructions: String
    //    let strMealThumb: String
    //    let strIngredient: String?
    //    let strMeasure: String?
    //    var isFavorite: Bool = false
    //    var isArchived: Bool = false
    //
    ////    let ingredient: [(name: String, measure: String)]?
    //
    //
    //
    //    //  ENABLE IDENTIFIABLE
    //    var id: String { idMeal}
    ////    let idMeal = UUID()
    //
    //
    //    // POSSIBLE TO SHORTHAND? ..."strIngredient\($)"
    //    //              "...+index"
    //
    //    enum CodingKeys: String, CodingKey {
    //        case idMeal
    //        case strMeal
    //        case strArea
    //        case strCategory
    //        case strInstructions
    //        case strMealThumb
    //        case strIngredient
    //        case strMeasure
    //        case isFavorite
    //        case isArchived
    //    }
    //
    //        init(from mealItemDecoder: Decoder) throws {
    //            let mealItemContainer = try mealItemDecoder.container(keyedBy: CodingKeys.self)
    //
    //            idMeal = try mealItemContainer.decode(String.self, forKey: .idMeal)
    //            strMeal = try mealItemContainer.decode(String.self, forKey: .strMeal)
    //            strArea = try mealItemContainer.decode(String.self, forKey: .strArea)
    //            strCategory = try mealItemContainer.decode(String.self, forKey: .strCategory)
    //            strInstructions = try mealItemContainer.decode(String.self, forKey: .strInstructions)
    //            strMealThumb = try mealItemContainer.decode(String.self, forKey: .strMealThumb)
    //
    //            strIngredient = try mealItemContainer.decode(String.self, forKey: .strIngredient)
    //            strMeasure = try mealItemContainer.decode(String.self, forKey: .strMeasure)
    //
    //            isFavorite = try mealItemContainer.decode(Bool.self, forKey: .isFavorite)
    //            isArchived = try mealItemContainer.decode(Bool.self, forKey: .isArchived)
    //
    //
    //    //        ingredient = (1...20).compactMap { index in guard
    //    //            let name = try? mealItemContainer.decodeIfPresent(String.self, forKey: CodingKeys(rawValue: "strIngredient\(index)")!),
    //    //            let measure = try? mealItemContainer.decodeIfPresent(String.self, forKey: CodingKeys(rawValue: "strMeasure\(index)")!),
    //    //            !name.isEmpty, !measure.isEmpty
    //    //            else {
    //    //            return nil
    //    //        }
    //    //            return (name, measure)
    //    //        }
    //    }
    //}
    //
    //
    ////    //  EDIT PRESENTATION OF INGREDIENT+MEASURE
    //
    ////    extension MealItem {
    ////        func measuredIngredient() -> String {
    ////            return ingredient?.map {
    ////                "\($0.name) (\($0.measure)"
    ////            }.joined(separator: ", ") ?? ""
    ////        }
    ////    }
