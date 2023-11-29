//
//  APIController.swift
//  Ratatouille
//
//  Created by oscar student on 21/11/2023.
//

import Foundation

struct APIController {
    static func getAllMeals(completion: @escaping ([MealItem]) -> Void){
        let apiURL = URL(string:
         "https://www.themealdb.com/api/json/v1/1/search.php?s=Cajun")!
//        "https://www.themealdb.com/api/json/v1/1/search.php?s=")!
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: apiURL)
                //                print("API Response Data: \(String(data: data, encoding: .utf8) ?? "No data")")
                
                let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                //                print("Decoded Meals: \(mealResponse.meals)")
                
                completion(mealResponse.meals)
                
            } catch {
                //                print("Error decoding API response: \(error)")
                completion([])
            }
        }
    }
    
    //Test comment
    
    private struct MealResponse: Decodable {
        let meals: [MealItem]
    }
}
