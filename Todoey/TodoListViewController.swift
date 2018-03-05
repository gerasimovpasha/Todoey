//
//  ViewController.swift
//  Todoey
//
//  Created by Pavel Gerasimov on 03.03.2018.
//  Copyright © 2018 Pavel Gerasimov. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    let itemArray = ["Find Mike", "Buy eggs", "Destroy demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK — Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK — Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if let txt = tableView.cellForRow(at: indexPath)?.textLabel?.text {
//            print(txt)
//        }
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }


}

