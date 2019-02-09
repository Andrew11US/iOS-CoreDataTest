//
//  CoreDataHandler.swift
//  CoreDataTest
//
//  Created by Andrew on 9/10/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import UIKit
import Foundation
import CoreData

public func saveData(toEntity: String, value: String, forKey: String) {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let newObject = NSEntityDescription.insertNewObject(forEntityName: toEntity, into: context)
    
    newObject.setValue(value, forKey: forKey)
    
    do {
        try context.save()
        print("Saved")
        
    } catch {
        print("Error occured when saving data")
        print("\(error.localizedDescription)")
    }  
}

public func getData(fromEntity: String, key: String) -> [String]? {
    
    var output = [String]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: fromEntity)
    request.returnsObjectsAsFaults = false
    
    do {
        let results = try context.fetch(request)
        
        if results.count > 0 {
            for result in results as! [NSManagedObject] {
                
                if let value = result.value(forKey: key) {
                    print(value)
                    output.append(value as! String)
                    return output
                }
            }
            return nil
        }
        
    } catch {
        print("Error loading data from Core Data")
        print("\(error.localizedDescription)")
    }
    return nil
}

public func getData(fromEntity: String, key: String) -> String? {
    
    var output = String()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: fromEntity)
    request.returnsObjectsAsFaults = false
    
    do {
        let results = try context.fetch(request)
        
        if results.count > 0 {
            for result in results as! [NSManagedObject] {
                
                if let value = result.value(forKey: key) {
                    print(value)
                    output = value as! String
                    return output
                }
            }
            return nil
        }
        
    } catch {
        print("Error loading data from Core Data")
        print("\(error.localizedDescription)")
    }
    return nil
}

public func deleteDataInObject(fromEntity: String) {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: fromEntity)
    request.returnsObjectsAsFaults = false
    
    do {
        
//        if let result = try? context.fetch(request) {
//            for object in result {
//                context.delete(object as! NSManagedObject)
//            }
//        }
        
        let results = try context.fetch(request)
        
        if results.count > 0 {
            for object in results as! [NSManagedObject] {
                context.delete(object)
            }
        }
        
    } catch {
        print("Error loading data from Core Data")
        print("\(error.localizedDescription)")
    }
}

public func deleteData(fromEntity: String, key: String, toDelete: String) {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: fromEntity)
    request.returnsObjectsAsFaults = false
    
    do {
        
        let results = try context.fetch(request)
        
        if results.count > 0 {
            
            for object in results as! [NSManagedObject] {
                
                if let value = object.value(forKey: key) {
                    if toDelete == value as! String {
                        print(value)
                        context.delete(object)
                    }
                    
                }
                
//                context.delete(object)
            }
            
            do {
                try context.save()
            } catch {
                print("Error saving context!")
            }
        }
        
    } catch {
        print("Error loading data from Core Data")
        print("\(error.localizedDescription)")
    }
}
