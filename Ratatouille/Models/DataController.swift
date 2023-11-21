//
//  DataController.swift
//  Ratatouille
//
//  Created by oscar student on 21/11/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "DataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data from the DataModel \(error.localizedDescription)")
            }
            
        }
    }
}
