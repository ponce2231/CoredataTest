//
//  ViewController.swift
//  CoredataTest
//
//  Created by Christopher Ponce Mendez on 2/5/20.
//  Copyright © 2020 Christopher Ponce Mendez. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: variables
//    var names: [String] = []
    var people: [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "The List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

//    MARK: Actions
    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New", message: "Add new name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "save", style: .default) { [unowned self] action in
            guard let textfield = alert.textFields?.first, let nameToSave = textfield.text else{
                return
            }
            self.save(name: nameToSave)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
//    MARK: STORE TO COREDATA
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        //MARK: STEP 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
//        MARK: STEP 2
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
//        MARK: STEP 3
        person.setValue(name, forKeyPath: "name")
        
//        MARK: STEP 4
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error), \(error.userInfo) ")
        }
    }
}
//MARK: DataSource Functions
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let person = people[indexPath.row]
        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
        
        return cell
    }
    
    
}

