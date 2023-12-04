import SwiftUI


struct EditAreaView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.strMeal, ascending: true)
        ]
    ) var savedMeals: FetchedResults<Meal>
    
    @State private var selectedMealID: String?
    @State private var selectAreaToEdit: String = ""
    @State private var successMessage: String? = nil
    
    
    
    
    var body: some View {
        List {
            Section(header: Text("Endre eksisterende landområder")) {
                VStack{
                    Picker("Velg en matrett å endre: ", selection: $selectedMealID) {
                        ForEach(savedMeals, id: \.idMeal) {
                            meal in Text(meal.strMeal ?? "fant ikke matrett").tag(meal.idMeal ?? "Fant ikke Id")
                        }
                    }
                        Text("Matrett: \(selectedMeal?.strMeal ?? "Ingen"), \nOmråde: \(selectedMeal?.strArea ?? "Ingen")")
                        .padding()
                }
        
                TextField("Tast inn nytt område", text: $selectAreaToEdit)
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
        .foregroundStyle(.brandPrimary)
        .onAppear {
                    selectedMealID = savedMeals.first?.idMeal ?? ""
                }
    }
    
    
    

    private var selectedMeal: Meal? {
        savedMeals.first { $0.idMeal == selectedMealID }
    }
    
    
    private func saveChanges() {
            guard let mealToUpdate = selectedMeal, !selectAreaToEdit.isEmpty else {
                print("Error: Meal or Text field nil or empty")
                return
            }
        
// WHAT TO EDIT:
            mealToUpdate.strArea = selectAreaToEdit
        
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
    EditAreaView()
}
