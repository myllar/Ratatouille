//
//  EditCategoryView.swift
//  Ratatouille
//
//  Created by oscar student on 03/12/2023.
//

import SwiftUI

struct EditCategoryView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
        ]
    ) var savedMeals: FetchedResults<Meal>
    
    @State private var selectedMealID: String?
    @State private var selectCategoryToEdit: String = ""
    @State private var successMessage: String? = nil

    
    
    
    var body: some View {
        List {
            Section(header: Text("Endre eksisterende kategorier")) {
                VStack{
                    Picker("Velg en matrett å endre kategori for: ", selection: $selectedMealID) {
                        ForEach(savedMeals, id: \.idMeal) {
                            meal in Text(meal.strMeal ?? "fant ikke kategori").tag(meal.idMeal ?? "Fant ikke Id")
                        }
                    }
                    Text("Matrett: \(selectedMeal?.strMeal ?? "Ingen"), \nKategori: \(selectedMeal?.strCategory ?? "Ingen")")
                        .padding()
                }
                
                TextField("Tast inn ny kategori", text: $selectCategoryToEdit)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()

                Button(action: {
                    saveChanges()
                }) {
                    Text(successMessage ?? "Lagre endring")
                }
            }
            .padding()
        }
        .onAppear {
                    selectedMealID = savedMeals.first?.idMeal ?? ""
                }
    }//END OF BODY
    
    
    
    
    private var selectedMeal: Meal? {
        savedMeals.first { $0.idMeal == selectedMealID }
    }
    
    
    private func saveChanges() {
            guard let mealToUpdate = selectedMeal, !selectCategoryToEdit.isEmpty else {
                print("Error: Meal or Text field nil or empty")
                return
            }
        
// WHAT TO EDIT:
            mealToUpdate.strCategory = selectCategoryToEdit
        
            do {
                try viewContext.save()
                withAnimation {
                    successMessage = "Vellykket endring!"
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        successMessage = nil
                    }
                }
            } catch {
                print("Error saving changes: \(error.localizedDescription)")
            }
        }
}

#Preview {
    EditCategoryView()
}
