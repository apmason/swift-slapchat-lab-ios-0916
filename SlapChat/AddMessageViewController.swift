//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Alexander Mason on 11/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {
    
    let store = DataStore.sharedInstance
    
    @IBAction func resetButton(_ sender: AnyObject) {
        let newArray = store.messages.sorted { (one, two) -> Bool in
            one.createdAt.timeIntervalSince1970 > two.createdAt.timeIntervalSince1970
        }
        
        print("new array =========")
        for i in newArray {
            print(i.content)
            
        }
         print("new array =========")
        
        print("stored array =========")
        for i in store.messages {
            print(i.content)
        }
        print("stored array =========")
        
        store.messages = newArray
        print("stored array again =========")
        for i in store.messages {
            print(i.content)
        }
        print("stored array again =========")
        print("was sorted")
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBOutlet weak var messageTextField: UITextField!
   
    @IBAction func saveButton(_ sender: AnyObject) {
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: store.persistentContainer.viewContext) as! Message
        message.content = self.messageTextField.text!
        message.createdAt = NSDate()
        
        store.saveContext()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
