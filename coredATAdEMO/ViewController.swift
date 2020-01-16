//
//  ViewController.swift
//  coredATAdEMO
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //1 instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        //2 this context is the manager like location manager , audio manager
        let context = appDelegate.persistentContainer.viewContext
//
//        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
//          //3 write into context
//        newUser.setValue("Nandu", forKey: "name")
//        newUser.setValue(7898456321, forKey: "phone")
//        newUser.setValue("pooja1998@gmail.ca", forKey: "email")
//        newUser.setValue(22, forKey: "age")
//
//        //4 save context
//
//        do{
//            try  context.save()
//            print("New User iS->\(newUser )")
//        }catch{
//            print("Soory!Something went Wrong")
//        }

        // 5fetch data and load it
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "name = %@", "Sanju")
        //request.predicate = NSPredicate(format: "email contains %@", ".com")
        request.returnsObjectsAsFaults = false
        //6-we find data
        do{
            let results = try context.fetch(request)
            if results.count > 0{
                for result in results as! [NSManagedObject]{
//
                    if let name = result.value(forKey: "name") {
                        print("Name->\(name)")
                    }
                    if let email = result.value(forKey: "Email") {
                        print("Email->\(email)")
                        let email = email as! String
                        //update Email
                        result.setValue(String (email.dropLast(2)) + "com", forKey: "email")
                        do{
                            try context.save()
                        }catch{
                            print(error)
                        }
                     }
                  //delete sanju
//                    if let name = result.value(forKey: "name") as? String{
//                        context.delete(result)
//                        do{
//                            try context.save()
//                        }catch{
//                            print("cant delete")
//                        }
//                        print(name)
//                    }
            }
            }
            
        
        }catch{
            print("Something went Wrong!!!!🥺")
        }
        
    }


}

