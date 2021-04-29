//
//  TaskListTableViewController.swift
//  TaskCoreData
//
//  Created by Joshua Hoyle on 4/27/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TaskController.sharedInstance.fetchTasks()
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.sharedInstance.tasks.count
    }
    //MARK: - Navigations
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as? TaskDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}
            let task = TaskController.sharedInstance.tasks[indexPath.row]
            destinationVC.task = task
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as? TaskTableViewCell  else {return UITableViewCell()}
        
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        
        
        cell.delegate = self
        cell.task = task
        return cell
        
    }
}
//MARK: - Extension

extension TaskListTableViewController:
    TaskCompletionDelegate {
    
    func taskCellButtonTapped(_ sender: TaskTableViewCell) {
        guard let task = sender.task else {return}
        TaskController.sharedInstance.toggleIsComplete(task: task)
        sender.updateViews()
    }

    
}

