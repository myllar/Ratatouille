import SwiftUI
import CoreData

struct SearchView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
        ]
    ) var savedMeals: FetchedResults<Meal>
    
    @State private var mealItems: [MealItem] = []
    @State private var searchText: String = ""
    @State private var selectCategory: String = ""
    @State private var selectArea: String = ""
    @State private var selectIngredient: String = ""
    
    @State private var setFavorite: Set<String> = Set(UserDefaults.standard.stringArray(forKey: "setFavorite") ?? [])
    
    @State private var saveMeal: Set<String> = Set(UserDefaults.standard.stringArray(forKey: "saveMeal") ?? [])
    
    @State private var isFavorite: Bool = false
    
    
    
    
    
//              FILTERED MEALS VIEW
    var loadFilteredMeals: [MealItem] {
        if searchText.isEmpty && selectCategory.isEmpty && selectArea.isEmpty {
            return mealItems
            
        } else if !searchText.isEmpty {
            return mealItems.filter { mealItem in
                mealItem.strMeal
                    .localizedCaseInsensitiveContains(searchText)
            }
            
            
        }else if !selectCategory.isEmpty {
            return mealItems.filter { mealItem in
                mealItem.strCategory == selectCategory
            }
            
            
        }else if !selectArea.isEmpty{
            return mealItems.filter { mealItem in
                mealItem.strArea == selectArea
            }
            

//        }else if !selectIngredient.isEmpty{
//            return mealItems.filter { mealItem in
//                mealItem.strIngredient == selectIngredient
//            }
//        }else if !selectIngredient.isEmpty{
//            return mealItems.filter { mealItem in
//                mealItem.measuredIngredient() == selectIngredient
//            }
            
            
        }
        else {
            return mealItems
        }
    }
   
    
    
    
    
    //          ADD FILTER SEARCH
    
    //          FILTER BY CATEGORY
    var filterCategory: [String] {
        Array(Set(mealItems.map(\.strCategory)))
    }
    
    var filterArea: [String] {
        Array(Set(mealItems.map(\.strArea)))
    }
    
//    var filterIngredient: [String] {
//        Array(Set(mealItems.map(\.strIngredient)))
//    }
    
    
    
    
    
    
    var body: some View {
        NavigationStack {
            //      MEAL VERTICAL FULL LIST VIEW:
            
            VStack(alignment: .leading){
                List (loadFilteredMeals, id: \.idMeal) { mealItems in
                    VStack (alignment: .leading) {
                        
                        NavigationLink {
                            
                            ScrollView {
                                VStack(alignment: .center) {
                                    if let mealImageURL = URL(string: mealItems.strMealThumb) {
                                        AsyncImage(url: mealImageURL) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(50)
                                                    .frame(width: 250, height: 250)
                                            case .failure:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(50)
                                                    .frame(width: 250, height: 250)
                                            case .empty:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(50)
                                                    .frame(width: 250, height: 250)
                                            @unknown default:
                                                fatalError()
                                            }
                                        }
                                        
                                        VStack(alignment: .center) {
                                            VStack(alignment: .center) {
                                                Text("\(mealItems.strMeal)").fontWeight(.bold)
                                            }
                                            .padding()
                                            
                                            VStack {
                                                Text("\(mealItems.strMeal) er en rett som har \(mealItems.strArea) opphav. Den er ansett som en matrett av typen  \(mealItems.strCategory). Om du ønsker å lære hva retten inneholder og hvordan den lages, bla deg nedover siden.")
                                            }
                                            .padding()
                                            
                                            VStack {
                                                Text("\(mealItems.strMeal) inneholder følgende ingredienser: ").fontWeight(.bold).padding()
                                                Text("\(mealItems.measuredIngredient())")
                                            }
                                            .padding()
                                            
                                            VStack {
                                                Text("Oppskrift og fremgangsmåte: ").fontWeight(.bold).padding()
                                                Text("\(mealItems.strInstructions)")
                                            }
                                            .padding()
                                        }
                                        
                                        .foregroundColor(.brandPrimary)
                                    }
                                }
                            }
                            
//redundant spacer?
                            Spacer()
                            
                        } label: {
        
                            
//       PREVIEW in List VIEW
                            
                            
                    
                            
                            
                            
                            VStack {
                                HStack {
                                    
                                    HStack {
                                        if let mealImageURL = URL(string: mealItems.strMealThumb) {
                                            AsyncImage(url: mealImageURL) { phase in
                                                switch phase {
                                                case .success(let image):
                                                    image
                                                        .resizable()
                                                        .scaledToFit()
                                                        .cornerRadius(100)
                                                        .padding()
                                                        .frame(height: 80)
                                                case .failure:
                                                    Image(systemName: "photo")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .cornerRadius(100)
                                                        .padding()
                                                        .frame(height: 80)
                                                case .empty:
                                                    Image(systemName: "photo")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .cornerRadius(100)
                                                        .padding()
                                                        .frame(height: 80)
                                                @unknown default:
                                                    fatalError("Unknown error")
                                                }
                                            }
                                        }
                                        
                                        VStack(alignment: .leading){
                                            Text("\(mealItems.strMeal)").fontWeight(.bold)
                                            Text("\(mealItems.strCategory)")
                                        }
                                    }
                                    
                                    
                                    Spacer()
                                    
//      refracture away from button
                                    HStack{
                                        Button(action: {
                                            toggleFavorite(mealItems.idMeal)
                                        }) {
                                            if setFavorite.contains(mealItems.idMeal) {
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.yellow)
                                            } else {
                                                Image(systemName: "star")
                                                    .foregroundColor(.yellow)
                                            }
                                        }
                                    }
                                    
                                    
                                    
                                    .swipeActions(edge: .leading) {
                                        HStack{
                                            Button(action: {
                                                toggleFavorite(mealItems.idMeal)
                                            }) {
                                                if setFavorite.contains(mealItems.idMeal) {
                                                    Image(systemName: "star.fill")
                                                } else {
                                                    Image(systemName: "star")
                                                }
                                            }
                                            .tint(.yellow)
                                        }
                                        
                                    }
                                    
                                    .swipeActions(edge: .trailing) {
                                        HStack{
                                            Button(action: {
                                                saveMealToMealContext(mealItems.idMeal)
                                            }) {
                                                Image(systemName: "archivebox")
                                            }
                                            .tint(.green)
                                        }
                                    }
                                    
                                    
                                    
                                }
                            }
                        }
                        .foregroundColor(.brandPrimary)
                        .scaledToFill()
                    }
                }
            }
            .navigationTitle("Søk")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    
                    VStack {
                        
                        HStack {
                            TextField("Søk matrett navn", text: $searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .scaledToFill()
                     
                            Picker("Filtrer på kategori", selection: $selectCategory) {
                                Image(systemName: "folder").tag("")
                                ForEach(filterCategory, id: \.self) {
                                    category in Text(category).tag(category)
                                }
                            }
                            
                            Picker("Filtrer på område", selection: $selectArea) {
                                Image(systemName: "globe").tag("")
                                ForEach(filterArea, id: \.self) {
                                    area in Text(area).tag(area)
                                }
                            }

//                            Picker("Filtrer på ingrediens", selection: $selectIngredient) {
//                                Image(systemName: "carrot").tag("")
//                            }

                        }
                    }
                    .scaledToFit()
                    .foregroundStyle(.brandPrimary)
                    .tint(.brandPrimary)
                }
             }//  Toolbar END
        }
        .onAppear {
            loadMealItems()
//            toggleFavorite("")
        }
    }
    
    

    

    func loadMealItems() {
        APIController.getAllMeals { loadedMealItems in
            DispatchQueue.main.async {
                self.mealItems = loadedMealItems
            }
        }
    }
    
    func toggleFavorite(_ id: String) {
           if setFavorite.contains(id) {
               setFavorite.remove(id)
               print("Removed meal \(id) from favorites")
           } else {
               setFavorite.insert(id)
               print("Added meal \(id) to favorites")
           }

           // Save the updated set of favorite IDs to UserDefaults
           UserDefaults.standard.set(Array(setFavorite), forKey: "setFavorite")
       }

    
    func saveMealToMealContext(_ id: String) {
        // Check if the meal with the given ID is already in the "Meal" context
        let fetchRequestMeal: NSFetchRequest<Meal> = Meal.fetchRequest()
        fetchRequestMeal.predicate = NSPredicate(format: "idMeal == %@", id)
        
        let fetchRequestArchived: NSFetchRequest<Archived> = Archived.fetchRequest()
        fetchRequestArchived.predicate = NSPredicate(format: "idMeal == %@", id)

        do {
            let matchingMeals = try viewContext.fetch(fetchRequestMeal)
            let matchingArchived = try viewContext.fetch(fetchRequestArchived)
            
            let combinedContext = matchingMeals + matchingArchived

            if let existingMeal = combinedContext.first {
                print("Meal \(id) Already exist")
                
            } else {
                saveMeal.insert(id)
                if let selectedMeal = mealItems.first(where: { $0.idMeal == id }) {
                    createMeal(from: selectedMeal)
                } else {
                    print("Meal with ID \(id) not found.")
                }
            }
        } catch {
            // Handle error
            print("Error fetching meal by ID: \(error.localizedDescription)")
        }
    }

    
    
    func createMeal(from APIController: MealItem) {
        let newMeal = Meal(context: viewContext)

        newMeal.idMeal = APIController.idMeal
        newMeal.strMeal = APIController.strMeal
        newMeal.strArea = APIController.strArea
        newMeal.strCategory = APIController.strCategory
        newMeal.strInstructions = APIController.strInstructions
        newMeal.strMealThumb = APIController.strMealThumb
        newMeal.strIngredient = APIController.strIngredient
        newMeal.strMeasure = APIController.strMeasure
        newMeal.isFavorite = APIController.isFavorite
        newMeal.isArchived = APIController.isArchived
        
        do {
            try viewContext.save()
            print("Meal successfully saved")
        } catch {
            print("Error, unable to save \(error)")
        }
    }
    
    
    
    

    
}
#Preview {
    SearchView()
}

