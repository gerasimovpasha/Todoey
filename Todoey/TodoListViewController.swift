//
//  ViewController.swift
//  Todoey
//
//  Created by Pavel Gerasimov on 03.03.2018.
//  Copyright © 2018 Pavel Gerasimov. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    var itemArray = ["Find Mike", "Buy eggs", "Destroy demogorgon"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            
            itemArray = items
            
        }
        
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
    
    //MARK — Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let allert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        allert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            if textField.text != "" {
                
                self.itemArray.append(textField.text!)
                
                self.defaults.set(self.itemArray, forKey: "TodoListArray")
                
                self.tableView.reloadData()
            }
            
            
        }
        
        allert.addAction(action)
        
        present(allert, animated: true, completion: nil)
        
        
        
    }
    


}

