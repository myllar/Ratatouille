//
//  MyFavoriteMeals.swift
//  Ratatouille
//
//  Created by oscar student on 18/11/2023.
//

//import SwiftUI
//import CoreData
//
//struct MyFavoriteMeals: View {
//    
//    @FetchRequest(
//        entity: Meal.entity(),
//        sortDescriptors: [
//            NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
//        ]
//        
//    ) var meals: FetchedResults<Meal>
//    
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(meals, id: \.id) { meal in
//                    //                        NavigationLink() {
//                    Text(meal.strMeal ?? "Unknown Meal")
//                    Text(meal.strCategory ?? "Unknown category")
//                    // Display other meal details as needed
//                }
//            }
//        }
//        .navigationBarTitle("All Meals")
//    }
//    
//}


import SwiftUI
import CoreData
//
//struct ArchivedMealItem {
//    var name: String
//    var category: String
//    // Add other attributes as needed
//}

struct MyFavoriteMeals: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
        ]
    ) var meals: FetchedResults<Meal>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(meals, id: \.id) { meal in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(meal.strMeal ?? "Unknown Meal")
                            Text(meal.strCategory ?? "Unknown category")
                        }
                        Spacer()
                        Button(action: {
                            toggleArchivedStatus(meal)
                        }) {
                            Text(meal.archived ? "Unarchive" : "Archive")
                                .foregroundColor(meal.archived ? .green : .red)
                        }
                    }
                }
            }
            .navigationBarTitle("All Meals")
        }
    }
    
    private func toggleArchivedStatus(_ meal: Meal) {
        withAnimation {
            meal.archived.toggle()
            
            // If archived, move to Archived entity
            if meal.archived {
                let archivedMeal = Archived(context: viewContext)
                archivedMeal.strMeal = meal.strMeal
                archivedMeal.strCategory = meal.strCategory
                // Copy other attributes as needed
                
                viewContext.delete(meal)
            }
            
            try? viewContext.save()
        }
    }
}

    #Preview {
        MyFavoriteMeals()
    }

