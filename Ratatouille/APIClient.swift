////
////  APIClient.swift
////  Ratatouille
////
////  Created by oscar student on 15/11/2023.
////
//
//import Foundation
//
//struct APIClient {
//    
//    var getMeals: (() async throws -> [Meal])
//    
//}
//
//extension APIClient {
//    
//    static let live = apiClient(getMeals: {
//        
//        let url = URL(string: "www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata")!
//        
//        let (data, response) = try await URLSession.shared.data(from:url)
//        let meals = try JSONDecoder().decode([Meal].self, from: data)
//        
//        return meals
//        
//    })
//
//    
//}
