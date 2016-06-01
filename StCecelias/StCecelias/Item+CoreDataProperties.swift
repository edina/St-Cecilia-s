//
//  Item+CoreDataProperties.swift
//  StCecelias
//
//  Created by Colin Gormley on 31/05/2016.
//  Copyright © 2016 Edina. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var name: String?
    @NSManaged var desc: String?
    @NSManaged var id: NSNumber?
    @NSManaged var collection: Collection?

}
