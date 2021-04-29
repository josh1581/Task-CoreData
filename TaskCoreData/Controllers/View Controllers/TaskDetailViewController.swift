//
//  TaskDetailViewController.swift
//  TaskCoreData
//
//  Created by Joshua Hoyle on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskNotesTextView: UITextView!
    
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    
    
    //MARK: - Actions
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty else {return}
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: taskNotesTextView.text, dueDate: date)
        } else {
            TaskController.sharedInstance.creatTaskWith(name: name, notes: taskNotesTextView.text, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func dueDatePIckerChanged(_ sender: UIDatePicker) {
        date = sender.date
    }
    func updateView() {
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
        
    }
}

