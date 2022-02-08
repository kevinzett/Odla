//
//  Odlalist+CoreDataProperties.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-02-03.
//
//

import Foundation
import CoreData


extension Odlalist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Odlalist> {
        return NSFetchRequest<Odlalist>(entityName: "Odlalist")
    }

    @NSManaged public var indexnum: Int64
    @NSManaged public var nameforimage: String?
    @NSManaged public var odlingname: String?

}

extension Odlalist : Identifiable {

}
