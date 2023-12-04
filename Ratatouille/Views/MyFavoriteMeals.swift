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
        
        if meals.count != 0 {
            NavigationStack {
                List {
                    ForEach(meals, id: \.id) { meal in
                        VStack {
                            NavigationLink {
                                ScrollView {
                                    VStack {
                                        
                                        VStack(alignment: .center) {
                                            VStack(alignment: .center) {
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(50)
                                                    .frame(width: 250, height: 250)
                                                
                                                Text("\(meal.strMeal ?? "404 / ukjent matrett")").fontWeight(.bold)
                                            }
                                            .padding()
                                            
                                            VStack {
                                                Text("\(meal.strMeal ?? "404 / ukjent matrett") er en rett som har \(meal.strArea ?? "404 / ukjent område") opphav. Den er ansett som en matrett av typen  \(meal.strCategory ?? "404 / ukjent kategori"). Om du ønsker å lære hva retten inneholder og hvordan den lages, bla deg nedover siden.")
                                            }
                                            .padding()
                                            
                                            VStack {
                                                Text("\(meal.strMeal ?? "404 / ukjent matrett") inneholder følgende ingredienser: ").fontWeight(.bold).padding()
                                                Text("\(meal.strIngredient ?? "404 /  ukjente ingredienser")")
                                            }
                                            .padding()
                                            
                                            VStack {
                                                Text("Oppskrift og fremgangsmåte: ").fontWeight(.bold).padding()
                                                Text("\(meal.strInstructions ?? "404 / ukjente instruksjoner")")
                                            }
                                            .padding()
                                        }
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
                }
            .foregroundStyle(.brandPrimary)
        } else {
            VStack{
                Image(systemName: "questionmark.folder")
                Text("Ingen matoppskrifter")
            }
            .padding()
            .foregroundStyle(.brandPrimary)
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

