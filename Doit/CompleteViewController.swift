//
//  CompleteViewController.swift
//  Doit
//
//  Created by Ivan Ghazal on 5/18/17.
//  Copyright © 2017 Ivan Ghazal. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    var task = Task()
    var previeusVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xcolor = task.groupColorTask
        backgroundView.backgroundColor = xcolor.withAlphaComponent(0.3)
        
        if task.important == true{
            nameLabel.text = "❗️  \(task.name)"
            
        }else{
            
            nameLabel.text = " \(task.name)"
        }
        
        
        
    }

    @IBAction func completeButtonDidPress(_ sender: Any) {
        
        previeusVC.tasks.remove(at: previeusVC.selectedIndex)
        previeusVC.mainTableView.reloadData()
        navigationController!.popViewController(animated: true)
    }

    

}
