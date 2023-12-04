import SwiftUI
import CoreData


struct ArchiveView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Archived.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Archived.idMeal, ascending: true)
        ]
    ) var archivedMeals: FetchedResults<Archived>
    
    
    
    
    var body: some View {
        if archivedMeals.count != 0 {
        NavigationStack {
            List {
                ForEach(archivedMeals, id: \.id) { meal in
                    VStack {
                        NavigationLink {
                            ScrollView {
                                VStack(alignment: .leading) {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(50)
                                        .frame(width: 250, height: 250)
                                    Text(meal.strMeal ?? "Unknown Meal")
                                    Text(meal.strCategory ?? "Unknown category")
                                }
                            }
                        } label: {
                            HStack {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(100)
                                    .padding()
                                    .frame(height: 80)
                                Text(meal.strMeal ?? "404 / ukjent matrett").fontWeight(.bold)
                                VStack {
                                    Text(meal.strCategory ?? "404 /  ukjent kategori")
                                    Text(meal.strArea ?? "404 / ukjent område")
                                }
                            }
                            .padding()
                            
                            .swipeActions(edge: .trailing)  {
                                HStack{
                                    Button(action: {
                                        toggleArchivedStatus(meal)
                                    }) {
                                        Image(systemName: "archivebox")
                                            .foregroundColor(.green)
                                    }
                                    .tint(.green)
                                }
                            }
                        
                            .swipeActions(edge: .trailing) {
                                
                                Button(action: {
                                    deleteMeal(meal)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                                .tint(.red)
                            }
                                    
                        }
                        
                        Spacer()
                        

                    }
                }
            }
            .navigationBarTitle("Arkiverte retter")
        }
        
        } else {
            VStack{
                Image(systemName: "questionmark.folder")
                Text("Ingen matoppskrifter")
            }
            .padding()
            .foregroundStyle(.brandPrimary)
        }

    }
    
    
    
    
    private func unarchiveMeal(_ meal: Archived) {
        let unarchivedMeal = Meal(context: viewContext)
        unarchivedMeal.idMeal = meal.idMeal
        unarchivedMeal.strMeal = meal.strMeal
        unarchivedMeal.strCategory = meal.strCategory
        
        try? viewContext.save()
        viewContext.delete(meal)
        try? viewContext.save()
    }
    
    
    
    
    private func toggleArchivedStatus(_ meal: Archived) {
        if !meal.isArchived {
            unarchiveMeal(meal)
            print("Successfully unArchived")
        }
        else {
            print("Error unarchiving meal from Archived entity")
        }
    }

    
    
        
        private func deleteMeal(_ meal: Archived) {
            viewContext.delete(meal)
            do {
                try viewContext.save()
                print("Successfully deleted from Archived entity")
            } catch {
                print("Error deleting meal from Archived entity: \(error)")
            }
        }

    

}
#Preview {
    ArchiveView()
}
