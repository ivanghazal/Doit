//
//  CreattTaskViewController.swift
//  Doit
//
//  Created by Ivan Ghazal on 5/18/17.
//  Copyright © 2017 Ivan Ghazal. All rights reserved.
//

import UIKit

class CreattTaskViewController: UIViewController   {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var color: UIPickerView!
    
    var previeusVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonDidPress(_ sender: Any) {
        //Creat Task the outlet information
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        task.groupColorTask = UIColor.gray
        
        
        
        //Add new task to Array in previuos viewController
        
        previeusVC.tasks.append(task)
        previeusVC.mainTableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }



}
