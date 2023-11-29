import SwiftUI


struct SearchView: View {
    
    @State private var mealItems: [MealItem] = []
    @State private var searchText: String = ""
    @State private var selectCategory: String = ""
    @State private var selectArea: String = ""
    
    @State private var setFavorite: Set<String> = Set(UserDefaults.standard.stringArray(forKey: "setFavorite") ?? [])
    @Environment(\.managedObjectContext) var mealDataContext
    
    
    //          FILTERED MEALS VIEW
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
    
    
    
    
    
    
    
    
    
    
    
    var body: some View {
        NavigationStack {
            
            HStack {
                Text("Velg filter eller søk fritekst")
                HStack {
                    VStack{
//                        Text("Filtrer på kategori")
                        Picker("Filtrer på kategori", selection: $selectCategory) {
                            Text("🍽️").tag("")
                            ForEach(filterCategory, id: \.self) {
                                category in Text(category).tag(category)
                            }
                        }
                    }
                    VStack{
//                        Text("Filtrer på område")
                        Picker("Filtrer på område", selection: $selectArea) {
                            Text("🌍").tag("")
                            ForEach(filterArea, id: \.self) {
                                area in Text(area).tag(area)
                            }
                        }
                    }
                }
                TextField("Søk matrett på navn", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            .foregroundColor(.brandPrimary)
            .padding()
            
            
            
            
//      MEAL VERTICAL FULL LIST VIEW:
            
            VStack{
                List (loadFilteredMeals, id: \.idMeal) { mealItems in
                    VStack (alignment: .leading) {
                        
                        NavigationLink {
                            
                            ScrollView {
                            
                            Button(action: {
                                toggleFavorite(mealItems.idMeal)
                            }) {
                                if setFavorite.contains(mealItems.idMeal) {
                                    Image(systemName: "star.fill")
                                } else {
                                    Image(systemName: "star")
                                }
                            }
                            
                            VStack(alignment: .center) {
                                
                                
                                if let mealImageURL = URL(string: mealItems.strMealThumb) {
                                    AsyncImage(url: mealImageURL) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(100)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(100)
                                        case .empty:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(100)
                                        @unknown default:
                                            fatalError()
                                        }
                                    }
//                                    HStack {
//                                        Text("\(mealItems.strMeal)").fontWeight(.bold)
//                                        Text("\(mealItems.strMeal)")
//                                    }
//                                    .foregroundColor(.brandPrimary)
                                    
//                                    VStack {
                                    VStack(alignment: .leading) {
                                        VStack(alignment: .leading) {
                                            Text("Name: ").fontWeight(.bold)
                                            Text("\(mealItems.strMeal)")
                                        }
                                        .padding()
                                        
                                        VStack(alignment: .leading) {
                                            Text("Area: ").fontWeight(.bold)
                                            Text("\(mealItems.strArea)")
                                        }
                                        .padding()
                                        
                                        VStack(alignment: .leading) {
                                            Text("Category: ").fontWeight(.bold)
                                            Text("\(mealItems.strCategory)")
                                        }
                                        .padding()
                                        
                                        VStack(alignment: .leading) {
                                            Text("You need: ").fontWeight(.bold)
                                            Text("\(mealItems.measuredIngredient())")
                                        }
                                        .padding()
                                        
                                        VStack(alignment: .leading) {
                                            Text("Instructions: ").fontWeight(.bold)
                                            Text("\(mealItems.strInstructions)")
                                        }
                                        .padding()
                                    }

                                    .padding()
                                    .foregroundColor(.brandPrimary)
                                }
                            }
                            }
                            
                            Spacer()
                            
                        } label: {
                            
                            
                            
                            
                            
                            
                            
                            //       PREVIEW VIEW
                           
                            
                            VStack {
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
                                            case .failure:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(100)
                                                    .padding()
                                            case .empty:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(100)
                                                    .padding()
                                            @unknown default:
                                                fatalError()
                                            }
                                        }
                                    }
                                    
                                    
                                    Text("Name: \(mealItems.strMeal)")
                                    Text("Area: \(mealItems.strArea)")
                                    Text("Category: \(mealItems.strCategory)")
                                    
                                    
//                                        .swipeActions(edge: HorizontalEdge .leading) {
                                        HStack{
                                            Button(action: {
                                                toggleFavorite(mealItems.idMeal)
                                            }) {
                                                if setFavorite.contains(mealItems.idMeal) {
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.red)
                                                } else {
                                                    Image(systemName: "star")
                                                        .foregroundColor(.green)
                                                }
                                            }
                                        }
//                                    }
                                
//                                    .swipeActions(edge: .leading) {
//                                        HStack{
//                                            Button(action: {
//                                                toggleFavorite(mealItems.idMeal)
//                                            }) {
//                                                if setFavorite.contains(mealItems.idMeal) {
//                                                    Image(systemName: "star.fill")
//                                                        .foregroundColor(.red)
////                                                } else {
////                                                    Image(systemName: "star")
////                                                        .foregroundColor(.green)
//                                                }
//                                            }
//                                        }
//                                    }
                                    
                                }
                            }
                        }
                        .foregroundColor(.brandPrimary)
                    }
                }
            }
            .navigationTitle("Søk")
        }
        .onAppear {
            loadMealItems()
        }
    }
    
    
    
    func loadMealItems() {
            APIController.getAllMeals { loadedMealItems in DispatchQueue.main.async {
                self.mealItems = loadedMealItems
            }
        }
    }
    
    //          ADD TOGGLE FAVORITE
    
    func toggleFavorite(_ id: String) {
            if setFavorite.contains(id) {
                setFavorite.remove(id)
                
                deleteMeal(withId: id)
                //
            } else {
                setFavorite.insert(id)
                
                if let selectedMeal = mealItems.first(where: {$0.idMeal == id}) {
                    createMeal(from: selectedMeal)
                }
            }
            
            UserDefaults.standard.set(Array(setFavorite), forKey: "savedFavoriteMeals")
    }
    
    
    func deleteMeal(withId: String) {
        // IMPLEMENT FUNCTIONALITY
    }
    
    func createMeal(from APIController: MealItem) {
        let newMeal = Meal(context: mealDataContext)
        
        newMeal.idMeal = APIController.idMeal
        newMeal.strMeal = APIController.strMeal
        newMeal.strArea = APIController.strArea
        newMeal.strCategory = APIController.strCategory
//        newMeal.strInstructions = APIController.strInstructions
        newMeal.strMealThumb = APIController.strMealThumb
        //    newMeal.strIngredient = APIController.strIngredient
        //    newMeal.strMeasure = APIController.strMeasure
        //    newMeal.ingredient = APIController.ingredient
        
        do {
            try mealDataContext.save()
            //        try DataController.shared.container?.viewContext.save()
            print("Meal successfully saved")
        } catch {
            print("Error, unable to save \(error)")
        }
        
    }
}
#Preview {
    SearchView()
}

