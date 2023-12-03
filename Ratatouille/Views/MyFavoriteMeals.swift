import SwiftUI
import CoreData

struct MyFavoriteMeals: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
        NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
        ]
    ) var meals: FetchedResults<Meal>
    
    
    @FetchRequest(
        entity: Archived.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Archived.idMeal, ascending: true)
        ]
    ) var archivedMeals: FetchedResults<Archived>
    
    
    @State private var saveMeal: Set<String> = Set(UserDefaults.standard.stringArray(forKey: "saveMeal") ?? [])
    
    @State private var mealItems: [MealItem] = []
    
    
    
    var body: some View {
        NavigationView {
    
            VStack(alignment: .leading){
                List (mealItems, id: \.idMeal) { mealItems in
                    VStack (alignment: .leading) {
                        Text(mealItems.strMeal)
                    }
                }
            }
            
            
//                if mealItems.count != 0 {
//                    List {
//                    
//                        ForEach(mealItems, id: \.id) { meal in
//                            HStack {
//                                VStack(alignment: .leading) {
//                                    Text(mealItems.strMeal ?? "Unknown Meal")
//                                    Text(mealItems.strCategory ?? "Unknown category")
//                                }
//                                Spacer()
//                                Button(action: {
//                                    toggleArchivedStatus(mealItems.idMeal)
//                                }) {
//                                    Image(systemName: "archivebox")
//                                }
//                                .tint(.red)
//                            }
//                        }
//                    }.navigationBarTitle("Mine oppskrifter")
//                }
//                else {
//                    VStack{
//                        Image(systemName: "questionmark.folder")
//                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                        Text("Ingen matoppskrifter")
//                    }
//                }
//            
            
        }
        .onAppear {
            loadMealItems()
        }
    }

    func loadMealItems() {
        APIController.getAllMeals { loadedMealItems in
            DispatchQueue.main.async {
                self.mealItems = loadedMealItems
            }
        }
    }
    
    
//    private func toggleArchivedStatus(_ meal: Meal) {
//        withAnimation {
//            meal.isArchived.toggle()
//
//            // If archived, move to Archived entity
//            if meal.isArchived {
//                let archivedMeal = Archived(context: viewContext)
//                archivedMeal.strMeal = meal.strMeal
//                archivedMeal.strCategory = meal.strCategory
//
//                // Delete the original Meal entity from the context
////                viewContext.delete(meal)
//            }
//
//            do {
//                // Save the changes to the Core Data persistent store
//                try viewContext.save()
//            } catch {
//                print("Error saving context: \(error)")
//            }
//        }
//    }
    
    private func toggleArchivedStatus(_ id: String) {
        let fetchRequestMeal: NSFetchRequest<Meal> = Meal.fetchRequest()
        fetchRequestMeal.predicate = NSPredicate(format: "idMeal == %@", id)
        
        do {
            let matchingArchived = try viewContext.fetch(fetchRequestMeal)
            if let existingMeal = matchingArchived.first {
                print("Meal \(id) is already archived")
            } else {
                saveMeal.insert(id)
            }
        } catch {
            print("Error saving to archive \(error.localizedDescription)")
        }
    }
    
    
    
    
    
    
    

}

    #Preview {
        MyFavoriteMeals()
    }



