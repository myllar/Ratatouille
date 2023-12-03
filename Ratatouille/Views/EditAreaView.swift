//
//  EditArea.swift
//  Ratatouille
//
//  Created by oscar student on 02/12/2023.
//

import SwiftUI

struct EditAreaView: View {
    
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
        ]
    ) var savedMeals: FetchedResults<Meal>
    

    
    @State private var inputPlaceHolder1 = ""
    @State private var inputPlaceHolder2 = ""
    @State private var inputPlaceHolder3 = ""
    
    @State private var selectedMealID: String?

    @State private var selectAreaToEdit: String = ""
    @State private var successMessage: String? = nil



    var body: some View {
        List {
            Section(header: Text("Endre eksisterende landområder")) {
                
                VStack{
                    
                    Text("Velg en matrett du ønsker å endre område for:")
                    
                    Text("\(selectedMeal?.strMeal ?? "Ingen valgt")")
                        .padding()
                
                    Picker("", selection: $selectedMealID) {
                        ForEach(savedMeals, id: \.idMeal) {
                            meal in Text(meal.strMeal ?? "fant ikke matrett").tag(meal.idMeal ?? "Fant ikke Id")
                        }
                        .pickerStyle(DefaultPickerStyle())
                    }
                }
                TextField("Tast inn nytt område", text: $selectAreaToEdit)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()
                
                Text("Velg en matrett du ønsker å endre område for:")
                                
//                Picker("velg landområde", text: )
                
                Button(action: {
                    placeHolderFunction1()
                }, label: {
                    Text("Opprett")
                })
            }
            .padding()
//            Section(header: Text("Redigere landområder")) {
//                VStack {
                    VStack{
                        Text("Selected Meal: \(selectedMeal?.strMeal ?? "None")")
                        
                        Picker("Select a Meal", selection: $selectedMealID) {
                            ForEach(savedMeals, id: \.idMeal) { meal in
                                Text(meal.strMeal ?? "Unknown Meal")
                                    .tag(meal.idMeal ?? "")
                            }
                        .pickerStyle(DefaultPickerStyle())
                        .padding()
                    }
                    VStack{
                        TextField("Edit", text: $selectAreaToEdit)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .scaledToFill()
                    }
                   
                    }
            VStack{
                Button(action: {
                    saveChanges()
                }) {
                    Text(successMessage ?? "Save Changes")
                }
                .padding()
//                }
                
//                Picker("Select a Meal", selection: $selectAreaToEdit) {
//                    ForEach(savedMeals, id: \.self) { meal in
//                        Text(meal.strMeal ?? "Unknown Meal")
//                    }
//                }
//                
//                TextField("edit", text: $selectAreaToEdit) {
//                }
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .scaledToFill()
//                Button(action: {
////                    placeHolderFunction2()
//                    saveChanges()
//                }, label: {
//                    Text("Rediger")
//                })
            }
            .padding()
            
            
            
            
            
            
            Section(header: Text("Arkiver landområder")) {
                TextField("Arkiver", text: $inputPlaceHolder3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()
                Button(action: {
                    placeHolderFunction3()
                }, label: {
                    Text("Arkiver")
                })
            }
            .padding()
        }
        .onAppear {
                    // Initialize selectedMealID with the first meal ID if available
                    selectedMealID = savedMeals.first?.idMeal ?? ""
                }
    }
    
    
    
    private var selectedMeal: Meal? {
        savedMeals.first { $0.idMeal == selectedMealID }
    }
    
    private func saveChanges() {
            guard let mealToUpdate = selectedMeal, !selectAreaToEdit.isEmpty else {
                print("Error: Meal or edit text is nil or empty")
                return
            }

            mealToUpdate.strMeal = selectAreaToEdit

            do {
                try viewContext.save()
                // Set success message and trigger animation
                withAnimation {
                    successMessage = "Success"
                }
                // Clear success message after 1 second
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        successMessage = nil
                    }
                }
            } catch {
                print("Error saving changes: \(error.localizedDescription)")
            }
        }
    
    
    
    
    
    
    
    
    
    func placeHolderFunction1() {
        print("Input is: '\(inputPlaceHolder1)' -- Button pressed")
        //add input to Meal context
    }
    
    func placeHolderFunction2() {
        print("Input is: '\(inputPlaceHolder2)' -- Button pressed")
        //add input to Meal context
    }
    func placeHolderFunction3() {
        print("Input is: '\(inputPlaceHolder3)' -- Button pressed")
        //add input to Meal context
    }
    
    
    
    
    
//
//    func createArea() {
//        let newArea = Meal(context: viewContext)
////        
////        newArea.idMeal = String.idMeal
////        newArea.strArea = String.strArea
//        
//        
//    }
//    
    
    
//    //FROM CREATE IN SEARCH VIEW
//    
//    func createMeal(from APIController: MealItem) {
//        let newMeal = Meal(context: viewContext)
//        
//        newMeal.idMeal = APIController.idMeal
//        newMeal.strMeal = APIController.strMeal
//        newMeal.strArea = APIController.strArea
//        newMeal.strCategory = APIController.strCategory
//        newMeal.strInstructions = APIController.strInstructions
//        newMeal.strMealThumb = APIController.strMealThumb
//        newMeal.strIngredient = APIController.strIngredient
//        newMeal.strMeasure = APIController.strMeasure
//        newMeal.isFavorite = APIController.isFavorite
//        newMeal.isArchived = APIController.isArchived
//        
//        do {
//            try viewContext.save()
//            print("Meal successfully saved")
//        } catch {
//            print("Error, unable to save \(error)")
//        }
//    }
//    
//    //FROM CREATE IN SEARCH VIEW - END
    
    
    
    
    
    
    
    
}
#Preview {
    EditAreaView()
}

















//USE TO FILTER
//VStack(alignment: .leading){
//    List (mealItems, id: \.idMeal) { mealItems in
//        VStack (alignment: .leading) {
//            Text(mealItems.strMeal)
//        }
//    }
//}
