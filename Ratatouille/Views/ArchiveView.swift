//import SwiftUI
//import CoreData
//
//struct ArchiveView: View {
//
//    @Environment(\.managedObjectContext) private var viewContext
//        
//        @FetchRequest(
//            entity: Archived.entity(),
//            sortDescriptors: [
//                
//                //KEY PATH NOT ID, ITS ORDER FOR SORTING
//                NSSortDescriptor(keyPath: \Archived.strMeal, ascending: true)
//            ]
//        ) var archivedMeals: FetchedResults<Archived>
//        
//    @FetchRequest(
//        entity: Meal.entity(),
//        sortDescriptors: [
//            
//            //KEY PATH NOT ID, ITS ORDER FOR SORTING
//            NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
//        ]
//    ) var unarchivedMeals: FetchedResults<Meal>
//    
//    
//    
//    
//    
//        var body: some View {
//            NavigationView {
//                List {
//                    ForEach(archivedMeals, id: \.id) { meal in
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text(meal.strMeal ?? "Unknown Meal")
//                                Text(meal.strCategory ?? "Unknown category")
//                            }
//                            Spacer()
//                            
//                            Button(action: {
//                                toggleArchivedStatus(meal)
//                            }) {
//                                Text(meal.archived ? "Unarchive" : "Archive")
//                                    .foregroundColor(meal.archived ? .green : .red)
//                            }
//                            
//                            Button(action: {
//                                deleteMeal(meal)
//                            }) {
//                                Image(systemName: "trash")
//                                    .foregroundColor(.red)
//                            }
//                            
////                            if meal.archived {
////                                Button(action: {
////                                    unarchiveMeal(meal)
////                                }) {
////                                    Text("Unarchive")
////                                        .foregroundColor(.blue)
////                                }
////                            }
//                        }
//                    }
//                }
//                .navigationBarTitle("Arkiverte retter")
//            }
//        }
//        
//
//// Move archived entity back to favorites
//        private func toggleArchivedStatus(_ meal: Archived) {
//            withAnimation {
//                meal.archived.toggle()
//                
//                 if !meal.archived {
//                    let archivedMeal = Meal(context: viewContext)
//                    archivedMeal.strMeal = meal.strMeal
//                    archivedMeal.strCategory = meal.strCategory
//                    viewContext.delete(meal)
//                }
//                try? viewContext.save()
//            }
//        }
//    
//    
//        
//        private func deleteMeal(_ meal: Archived) {
//            viewContext.delete(meal)
//            do {
//                try viewContext.save()
//                print("Successfull delete from Archived entity")
//            } catch {
//                print("Error deleting meal from Archived entity: \(error)")
//            }
//        }
//        
//        private func unarchiveMeal(_ meal: Meal) {
//            withAnimation {
//                let unarchivedMeal = Meal(context: viewContext)
//                unarchivedMeal.strMeal = meal.strMeal
//                unarchivedMeal.strCategory = meal.strCategory
//                
//                viewContext.delete(meal)
//                
//                try? viewContext.save()
//                print("Successfull delete from Archived entity")
//            }
//        }
//    }
//
//#Preview {
//    ArchiveView()
//}



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
    
    
    
    
    //    @FetchRequest(
    //        entity: Meal.entity(),
    //        sortDescriptors: [
    //            NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
    //        ]
    //    ) var savedMeals: FetchedResults<Meal>
    //
    //
    
    
    
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
                                    //                                toggleDeletedStatus(meal)
                                }) {
                                    //                            Text("Delete")
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                    //                            Text(meal.archived ? "Are you sure?" : "Delete")
                                    //                                .foregroundColor(meal.archived ? .green : .red)
                                }
                                .tint(.red)
                            }
                    }
                }
            }
            .navigationBarTitle("Arkiverte retter")
        }
    }
    
    // Unarchive meal and create a new instance in the Meal entity
    private func unarchiveMeal(_ meal: Archived) {
        let unarchivedMeal = Meal(context: viewContext)
        unarchivedMeal.idMeal = meal.idMeal
        unarchivedMeal.strMeal = meal.strMeal
        unarchivedMeal.strCategory = meal.strCategory
        
        try? viewContext.save()
        viewContext.delete(meal)
        try? viewContext.save()
    }
    
    
    
    
    // Move archived entity back to favorites
    private func toggleArchivedStatus(_ meal: Archived) {
        //        withAnimation {
        //            meal.archived.toggle()
        
        if !meal.isArchived {
            unarchiveMeal(meal)
            print("Successfully unArchived")
        }
        else {
            print("Error unarchiving meal from Archived entity")
        }
        //        }
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
    
        // Move archived entity back to favorites
        private func toggleDeletedStatus(_ meal: Archived) {
    //        withAnimation {
    //            meal.toggle()
    
                if !meal.isArchived {
                    deleteMeal(meal)
                    print("Successfully deleted")
                } else {
                    print("Error deleting meal from Archived entity")
                }
    //        }
        }
    
    
    
    


    
    
    
    
}


#Preview {
    ArchiveView()
}
