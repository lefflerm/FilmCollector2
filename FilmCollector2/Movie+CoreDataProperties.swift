//
//  Movie+CoreDataProperties.swift
//  FilmCollector2
//
//  Created by student on 5/3/16.
//  Copyright © 2016 student. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var title: String
    @NSManaged var director: String
    @NSManaged var rating: String
    @NSManaged var genre: String

}
