//import SwiftUI
//import CoreData
//
//struct MyFavoriteMeals: View {
//    
//    @Environment(\.managedObjectContext) private var viewContext
//    
//    @FetchRequest(
//        entity: Meal.entity(),
//        sortDescriptors: [
//            NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
//        ]
//    ) var savedMeals: FetchedResults<Meal>
//    
//    
//    @FetchRequest(
//        entity: Archived.entity(),
//        sortDescriptors: [
//            NSSortDescriptor(keyPath: \Archived.idMeal, ascending: true)
//        ]
//    ) var archivedMeals: FetchedResults<Archived>
//    
//    
//    @State private var saveMeal: Set<String> = Set(UserDefaults.standard.stringArray(forKey: "saveMeal") ?? [])
//
//    
//    @State private var setFavorite: Set<String> = Set(UserDefaults.standard.stringArray(forKey: "setFavorite") ?? [])
//    
//    
////    @State private var mealItems: [MealItem] = []/
//    
//    
//    var body: some View {
//        NavigationView {
//            if savedMeals.count != 0 {
//                List(savedMeals, id: \.self) { mealItems in
//                    NavigationLink {
//                        ScrollView{
//                            Text(mealItems.strMeal ?? "Unknown Meal")
//                        }//END OF DETAILED VIEW
//                        
//                    }label: {
//                        Text(mealItems.strMeal ?? "Unknown Meal")
//                        HStack{
//                            Button(action: {
////                                toggleArchivedStatus(mealItems.idMeal!)
//                            }) {
//                                Image(systemName: "archivebox")
//                            }
//                            .tint(.red)
//                        }
//                    }//END OF PREVIEW VIEW AS LIST ITEM
//                }
//            } else {
//                VStack(alignment: .center){
//                    Image(systemName: "questionmark.folder")
//                        .padding()
//                    Text("Du har ingen favoritter! \nDu kan dobbeltsjekke arkivet under instillinger, eller gå til søk for å lagre nye oppskrifter!")
//                        .multilineTextAlignment(.center)
//                }
//                .padding()
//                .foregroundStyle(.brandPrimary)
//            }
//        }
//        .navigationTitle("Mine oppskrifter")
//    }
//  
//        func loadSavedMealsItems(_ savedMeals: [Meal]) {
//            for savedMealItem in savedMeals {
//                print("\(savedMealItem.idMeal ?? "default value")")
//            }
//        }
//}
//
//    #Preview {
//        MyFavoriteMeals()
//    }





import SwiftUI
import CoreData

struct MyFavoriteMeals: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            
            //KEY PATH ID?
            NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
        ]
    ) var meals: FetchedResults<Meal>
    
    var body: some View {
        NavigationView {
            
                if meals.count != 0 {
                    List {
                    
                        ForEach(meals, id: \.id) { meal in
                            HStack {
                                HStack() {
                                    Text(meal.strMeal ?? "Unknown Meal")
                                    Text(meal.strCategory ?? "Unknown category")
                                    Text(meal.strArea ?? "Unknown area")
//                                    Text(meal.strInstructions ?? "Unknown Instructions")
                                }
                                
                                Spacer()
                                
                                    .swipeActions(edge: .trailing) {
                                        HStack{
                                            Button(action: {
                                                toggleArchivedStatus(meal)
                                            }) {
                                                Image(systemName: "archivebox")
                                            }
                                            .tint(.red)
                                        }
                                    }
                            }
                        }
                    }.navigationBarTitle("Mine oppskrifter")
                }
                else {
                    VStack{
                        Image(systemName: "questionmark.folder")
                        Text("Ingen matoppskrifter")
                    }
                    .padding()
                }
        }
    }

    
    private func toggleArchivedStatus(_ meal: Meal) {
        withAnimation {
            meal.isArchived.toggle()

            // If archived, move to Archived entity
            if meal.isArchived {
                let archivedMeal = Archived(context: viewContext)
                archivedMeal.strMeal = meal.strMeal
                archivedMeal.strCategory = meal.strCategory
                archivedMeal.strArea = meal.strArea

                // Delete the original Meal entity from the context
                viewContext.delete(meal)
            }

            do {
                // Save the changes to the Core Data persistent store
                try viewContext.save()
            } catch {
                print("Error saving context: \(error)")
            }
        }
    }

}

    #Preview {
        MyFavoriteMeals()
    }

