//
//  ViewController.swift
//  CoredataTest
//
//  Created by Christopher Ponce Mendez on 2/5/20.
//  Copyright © 2020 Christopher Ponce Mendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: variables
    var names: [String] = []
    
    
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
            self.names.append(nameToSave)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}
//MARK: DataSource Functions
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    
}

