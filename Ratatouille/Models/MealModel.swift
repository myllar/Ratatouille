import Foundation
import UIKit

struct MealItem: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strArea: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    
    var isFavorite: Bool = false
    var isArchived: Bool = false
    
    let strIngredient: String?
    let strMeasure: String?
    
    let ingredient: [(name: String, measure: String)]?
    
    //  ENABLE IDENTIFIABLE
    var id: String { idMeal }
    
    
    
    // POSSIBLE TO SHORTHAND? ..."strIngredient\($)"
    //              "...+index"
    
    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strArea
        case strCategory
        case strInstructions
        case strMealThumb

        case isFavorite
        case isArchived
                
        case strIngredient
        case strMeasure

        case ingredient
                
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
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
        
                strIngredient = try mealItemContainer.decodeIfPresent(String.self, forKey: .strIngredient)
                strMeasure = try mealItemContainer.decodeIfPresent(String.self, forKey: .strMeasure)
        
//                isFavorite = try mealItemContainer.decode(Bool.self, forKey: .isFavorite)
//                isArchived = try mealItemContainer.decode(Bool.self, forKey: .isArchived)
    
        
        
        ingredient = (1...20).compactMap { index in guard
            let name = try? mealItemContainer.decodeIfPresent(String.self, forKey: CodingKeys(rawValue: "strIngredient\(index)")!),
            let measure = try? mealItemContainer.decodeIfPresent(String.self, forKey: CodingKeys(rawValue: "strMeasure\(index)")!),
            !name.isEmpty, !measure.isEmpty
            else {
            return nil
        }
            return (name, measure)
        }
        
        
    }
        
        
        
        func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)

                try container.encode(idMeal, forKey: .idMeal)
                try container.encode(strMeal, forKey: .strMeal)
                try container.encode(strArea, forKey: .strArea)
                try container.encode(strCategory, forKey: .strCategory)
                try container.encode(strInstructions, forKey: .strInstructions)
                try container.encode(strMealThumb, forKey: .strMealThumb)
                try container.encode(ingredient?.map { ["name": $0.name, "measure": $0.measure] }, forKey: .ingredient)
                try container.encode(isFavorite, forKey: .isFavorite)
                try container.encode(isArchived, forKey: .isArchived)
            }
    }
    
    
    
    
        //  EDIT PRESENTATION OF INGREDIENT+MEASURE
    extension MealItem {
        func measuredIngredient() -> String {
            return ingredient?.map {
                "*\($0.name), \($0.measure). \n"
            }.joined(separator: " ") ?? ""
        }
    }
