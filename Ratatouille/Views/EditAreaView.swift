//
//  EditArea.swift
//  Ratatouille
//
//  Created by oscar student on 02/12/2023.
//

import SwiftUI

struct EditAreaView: View {
    
    @State private var inputPlaceHolder = ""
    
//    var addArea: ((Meal) -> ())
//    init(addArea: @escaping ((Meal) -> Void) ) {
//        self.addArea = addArea
//    }
//    @State private var newAreaName = ""
//    
//    
//    

    var body: some View {
        List {
            Section(header: Text("Opprette landområder")) {
                //                Text("Hello")
                TextField("Søk matrett navn", text: $inputPlaceHolder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()
                Button(action: {
                    placeHolderFunction()
                }, label: {
                    Text("Opprett")
                })
            }
            .padding()
            
            Section(header: Text("Redigere landområder")) {
                TextField("Søk matrett navn", text: $inputPlaceHolder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()
                Button(action: {
                    placeHolderFunction()
                }, label: {
                    Text("Rediger")
                })
            }
            .padding()
            
            Section(header: Text("Arkiver landområder")) {
                TextField("Søk matrett navn", text: $inputPlaceHolder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .scaledToFill()
                Button(action: {
                    placeHolderFunction()
                }, label: {
                    Text("Arkiver")
                })
            }
            .padding()
        }
    }
    
    
    
    
    func placeHolderFunction() {
        print("Input is: '\(inputPlaceHolder)' -- Button pressed")
        //add input to Meal context
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
//    func createArea() {
//        let newArea = Meal(context: viewContext)
////        
////        newArea.idMeal = String.idMeal
////        newArea.strArea = String.strArea
//        
//        
//    }
    
    
    
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
