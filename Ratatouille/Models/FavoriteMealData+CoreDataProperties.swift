//
//  FavoriteMealData+CoreDataProperties.swift
//  Ratatouille
//
//  Created by oscar student on 19/11/2023.
//
//

import Foundation
import CoreData


extension FavoriteMealData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMealData> {
        return NSFetchRequest<FavoriteMealData>(entityName: "FavoriteMealData")
    }

    @NSManaged public var idMeal: String?
    @NSManaged public var strArea: String?
    @NSManaged public var strCategory: String?
    @NSManaged public var strIngredient: String?
    @NSManaged public var strInstructions: String?
    @NSManaged public var strMeal: String?
    @NSManaged public var strMealThumb: String?
    @NSManaged public var strMeasure: String?

}

extension FavoriteMealData : Identifiable {

}
