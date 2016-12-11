//
//  ViewController.swift
//  TaskKeeper
//
//  Created by Dakota Brown on 12/11/16.
//  Copyright © 2016 Dakota Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tasks : [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = createTask()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important{
            cell.textLabel?.text = "❗️ \(task.name)"
        }
        else{
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    @IBAction func tapNewTask(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: nil)
    }
    
    func createTask() -> [Task]{
        let task1 = Task()
        task1.name = "Walk the Dog"
        task1.important = true
        
        let task2 = Task()
        task2.name = "Do the Laundry"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Go Running"
        task3.important = false
        
        return [task1, task2, task3]
    }

}

