//
//  Collection+CoreDataProperties.swift
//  StCecelias
//
//  Created by Colin Gormley on 25/05/2016.
//  Copyright © 2016 Edina. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Collection {

    @NSManaged var name: String?
    @NSManaged var id: String?
    @NSManaged var desc: String?

}
