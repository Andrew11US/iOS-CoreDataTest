//
//  SecondVC.swift
//  CoreDataTest
//
//  Created by Andrew on 2/9/19.
//  Copyright © 2019 Andrii Halabuda. All rights reserved.
//

import UIKit
import CoreData

class SecondVC: UIViewController {
    
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var input: UITextField!
    
    enum Entities : String, CaseIterable {
        case Users
        case Player
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func saveToDatabase(_ sender: UIButton) {
        
//        deleteDataInObject(fromEntity: Entities.Player.rawValue)
        deleteData(fromEntity: Entities.Player.rawValue, key: "name", toDelete: "John")
        
        if input.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" || input.text?.trimmingCharacters(in: .whitespacesAndNewlines) != nil {
            
            guard let value = input.text else {
                debugPrint("Value is empty!")
                return
            }
            
            
        saveData(toEntity: Entities.Player.rawValue, value: value, forKey: "name")
            
        }
    }
    
    @IBAction func showData(_ sender: UIButton) {
        output.text = getData(fromEntity: Entities.Player.rawValue, key: "name")
    }
}
