//
//  CompleteTaskViewController.swift
//  TaskKeeper
//
//  Created by Dakota Brown on 12/11/16.
//  Copyright © 2016 Dakota Brown. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskLabel.text = task!.name!
    }
    
    //When complete button is tapped the task that was passed in from the context. The context is saved and then the nav controlller returns the user to the previous view. 
    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }

}
