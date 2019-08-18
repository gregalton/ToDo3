//
//  ViewController.swift
//  ToDo3
//
//  Created by Greg Alton on 8/13/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let moContext = PersistentService.context
    var items = [ListItem]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addButton(_ sender: Any) {
        let addItem = UIAlertController(title: "Add ToDo", message: "Add a new todo", preferredStyle: .alert)
        addItem.addTextField()
        
        let addItemAction = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let entity = NSEntityDescription.entity(forEntityName: "ListItem", in: self.moContext)
            let listItem = NSManagedObject(entity: entity!, insertInto: self.moContext) as? ListItem
            listItem?.title = addItem.textFields![0].text
            listItem?.isChecked = false
            PersistentService.saveContext()
            self.items = PersistentService.getListItems()
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        addItem.addAction(addItemAction)
        addItem.addAction(cancelAction)
        
        present(addItem, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        self.items = PersistentService.getListItems()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemCell
        if(item.isChecked == false) {
            cell.checkBox.image = UIImage(named: "unchecked")
        } else {
            cell.checkBox.image = UIImage(named: "checked")
        }
        cell.title.text = item.title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listItem = self.items[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! ItemCell
        if(cell.isChecked == false) {
            cell.checkBox.image = UIImage(named: "checked.jpg")
            cell.isChecked = true
            listItem.isChecked = true
            PersistentService.saveContext()
        } else {
            cell.checkBox.image = UIImage(named: "unchecked.jpg")
            cell.isChecked = false
            listItem.isChecked = false
            PersistentService.saveContext()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            let listItem = self.items[indexPath.row]
            self.items.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .left)
            self.moContext.delete(listItem)
            PersistentService.saveContext()
        }
    }

}

