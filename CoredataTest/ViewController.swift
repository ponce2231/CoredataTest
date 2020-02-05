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
    var name: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "The List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }


    @IBAction func addName(_ sender: UIBarButtonItem) {
        
    }
}

