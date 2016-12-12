//
//  NewTaskViewController.swift
//  TaskKeeper
//
//  Created by Dakota Brown on 12/11/16.
//  Copyright © 2016 Dakota Brown. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    //Outlets created so that taskNameField and important switch can be referenced
    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //When the add task button is tapped the task name and important status are set to what the user provided in the outlets. The data is saved to the core data contect and then the navigation controller will return the user to the previous view.
    @IBAction func addTaskTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.name = taskNameField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

        navigationController!.popViewController(animated: true)
    }
    
    

}
