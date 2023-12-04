import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var idMeal: String?
    @NSManaged public var isArchived: Bool
    @NSManaged public var isFavorite: Bool
    @NSManaged public var strArea: String?
    @NSManaged public var strCategory: String?
    @NSManaged public var strIngredient: String?
    @NSManaged public var strInstructions: String?
    @NSManaged public var strMeal: String?
    @NSManaged public var strMealThumb: String?
    @NSManaged public var strMeasure: String?
    

}
