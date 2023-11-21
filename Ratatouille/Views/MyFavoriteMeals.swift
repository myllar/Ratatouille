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
            .navigationBarTitle("Mine favoritter")
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
                
                viewContext.delete(meal)
            }
            
            try? viewContext.save()
        }
    }
}

    #Preview {
        MyFavoriteMeals()
    }

