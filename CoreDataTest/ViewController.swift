//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Andrew Foster on 6/7/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var usernames = [String]()
    var passwords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getData()
        CoreDataTest.saveData(toEntity: "Users", value: "1747gq374g348", forKey: "username")
        getData()
    }
    
    func saveData() {
        //MARK: Create appDelegate, context and NSEntityDescription
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Emmy", forKey: "username")
        newUser.setValue("3r23fh24f89", forKey: "password")
        
        //MARK: Try context to save and check for errors
        do {
            try context.save()
            print("Saved")
            
        } catch {
            print("Error occured when saving data")
            print("\(error.localizedDescription)")
        }
    }
    
    func getData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") {
                        print(username)
                        self.usernames.append(username as! String)
                    }
                    
                    if let pass = result.value(forKey: "password") {
                        print(pass)
                        self.passwords.append(pass as! String)
                    }
                }
                print(usernames)
                print(passwords)
            }
            
        } catch {
            
        }
    }


}

