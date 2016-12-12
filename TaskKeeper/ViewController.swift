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
    
    //Creates an empty array of Task objects
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //Each time the view appears run the getTasks function and reload the table view
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    //Number of tabel rows equals the number of elements in the tasks array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    //Returns the data to be displayed in a cell. The data is taken from the Task object. It uses the name property of the object.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        //If task is important an explanation emoji is placed at begining
        if task.important{
            cell.textLabel?.text = "❗️ \(task.name!)"
        }
        else{
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    //New task button will perform segue to the addTask view controller
    @IBAction func tapNewTask(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: nil)
    }
    
    //webUI button will perform a segue to the webUI view controller
    @IBAction func tapWebUI(_ sender: Any) {
        performSegue(withIdentifier: "webUI", sender: nil)
    }
    
    //Pulls all the tasks from the core database as an array of Task objects and sets them to tasks so that they can be referenced.
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
           tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        }
        catch{
            print("Error")
        }
        
    }
    
    //If a task is selected before moving to the next view controller this function will prepare to pass the selected task to the CompleteTaskViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTask"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
        }
    }
    
    //Initiates the segue when a task/row is selected in the table. Sends the task in the tasks array at the index of the row.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTask", sender: task)
    }
    
}

