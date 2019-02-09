//
//  Users+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Andrew Foster on 6/8/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var password: String?
    @NSManaged public var success: Bool
    @NSManaged public var username: String?

}
