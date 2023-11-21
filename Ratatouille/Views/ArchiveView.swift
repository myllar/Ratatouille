import SwiftUI
import CoreData

struct ArchiveView: View {

    @Environment(\.managedObjectContext) private var viewContext
        
        @FetchRequest(
            entity: Archived.entity(),
            sortDescriptors: [
                
                //KEY PATH ID?
                NSSortDescriptor(keyPath: \Archived.strMeal, ascending: true)
            ]
        ) var archivedMeals: FetchedResults<Archived>
        
        var body: some View {
            NavigationView {
                List {
                    ForEach(archivedMeals, id: \.id) { meal in
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
                            
//                            Button(action: {
//                                deleteMeal(meal)
//                            }) {
//                                Image(systemName: "trash")
//                                    .foregroundColor(.red)
//                            }
                            
//                            if meal.archived {
//                                Button(action: {
//                                    unarchiveMeal(meal)
//                                }) {
//                                    Text("Unarchive")
//                                        .foregroundColor(.blue)
//                                }
//                            }
                        }
                    }
                }
                .navigationBarTitle("Arkiverte retter")
            }
        }
        

// Move archived entity back to favorites
        private func toggleArchivedStatus(_ meal: Archived) {
            withAnimation {
                meal.archived.toggle()
                
                 if !meal.archived {
                    let archivedMeal = Meal(context: viewContext)
                    archivedMeal.strMeal = meal.strMeal
                    archivedMeal.strCategory = meal.strCategory
                    viewContext.delete(meal)
                }
                
                try? viewContext.save()
            }
        }
    
    
        
        private func deleteMeal(_ meal: Meal) {
            viewContext.delete(meal)
            do {
                try viewContext.save()
            } catch {
                print("Error deleting meal: \(error)")
            }
        }
        
        private func unarchiveMeal(_ meal: Meal) {
            withAnimation {
                let unarchivedMeal = Meal(context: viewContext)
                unarchivedMeal.strMeal = meal.strMeal
                unarchivedMeal.strCategory = meal.strCategory
                
                viewContext.delete(meal)
                
                try? viewContext.save()
            }
        }
    }

#Preview {
    ArchiveView()
}
