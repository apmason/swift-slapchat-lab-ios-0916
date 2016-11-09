//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var store = DataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.store.fetchData()
        print(store.messages.count)
        
        
        if store.messages.isEmpty {
            self.generateTestData()
        }
        print(store.messages.count)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        store.fetchData()
        tableView.reloadData()
        
    }
    
    func generateTestData() {
        let messageOne = NSEntityDescription.insertNewObject(forEntityName: "Message", into: store.persistentContainer.viewContext) as! Message
        messageOne.content = "Hey"
        messageOne.createdAt = NSDate()
        
        let messageTwo = NSEntityDescription.insertNewObject(forEntityName: "Message", into: store.persistentContainer.viewContext) as! Message
        messageTwo.content = "I'm the second message"
        messageTwo.createdAt = NSDate()
        
        store.saveContext()
        store.fetchData()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        cell.textLabel?.text = store.messages[indexPath.row].content
        return cell
    }
    
    
    
    
    
    
    
    
}
