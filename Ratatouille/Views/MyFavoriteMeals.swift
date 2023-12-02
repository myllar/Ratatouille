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
                                VStack(alignment: .leading) {
                                    Text(meal.strMeal ?? "Unknown Meal")
                                    Text(meal.strCategory ?? "Unknown category")
                                }
                                Spacer()
                                Button(action: {
                                    toggleArchivedStatus(meal)
                                }) {
                                    //                            Text(meal.archived ? "Unarchive" : "Archive")
                                    //                                .foregroundColor(meal.archived ? .green : .red)
                                    Image(systemName: "archivebox")
                                }
                                .tint(.red)
                            }
                        }
                    }.navigationBarTitle("Mine oppskrifter")
                }
                else {
                    VStack{
                        Image(systemName: "questionmark.folder")
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Ingen matoppskrifter")
                    }
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
                
//                toggleFavorite(/*T##String*/)
                viewContext.delete(meal)
            }
            
            try? viewContext.save()
        }
    }
}

    #Preview {
        MyFavoriteMeals()
    }

