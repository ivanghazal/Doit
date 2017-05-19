//
//  TasksViewController.swift
//  Doit
//
//  Created by Ivan Ghazal on 5/17/17.
//  Copyright © 2017 Ivan Ghazal. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate{

    @IBOutlet weak var mainTableView: UITableView!
    
    var tasks :[Task] = []
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        tasks = makeTask()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "System", size: 30)
        let task = tasks[indexPath.row]
        let xcolor = task.groupColorTask
        cell.backgroundColor = xcolor.withAlphaComponent(0.3)
        
        if task.important == true{
            cell.textLabel?.text = "❗️ \(task.name) "

        }else{
        
            cell.textLabel?.text = " \(task.name) "
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
       let task = tasks[indexPath.row]
      performSegue(withIdentifier: "selectTaskSegue" , sender: task)
    }

    
    

    func makeTask() -> [Task] {
    
        let task1 = Task()
        task1.name = "Walk the Dog"
        task1.important = false
        task1.groupColorTask = .red
        
        let task2 = Task()
        task2.name = "Buy new english book"
        task2.important = true
        task2.groupColorTask = .blue
        
        let task3 = Task()
        task3.name = "Call Joseph for Codey"
        task3.important = false
        task3.groupColorTask = .yellow
        
        let task4 = Task()
        task4.name = "buy milk,beer ,Egg"
        task4.important = true
        task4.groupColorTask = .blue
        
        return  [task1, task2, task3, task4]
    }
    
    @IBAction func plusButtonDidTouch(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreattTaskViewController
            nextVC.previeusVC = self
        }
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteViewController
            nextVC.task = sender as! Task
            nextVC.previeusVC = self
        }
       


    }

    
    

}

