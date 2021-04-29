//
//  TaskTableViewCell.swift
//  TaskCoreData
//
//  Created by Joshua Hoyle on 4/27/21.
//

import UIKit

//MARK: - Protocol
protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
    
    
}


class TaskTableViewCell: UITableViewCell {

 //MARK: - Outlets
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var completionButtion: UIButton!
    
    //MARK: - Properties
    weak var delegate: TaskCompletionDelegate?
    var task: Task? {
        didSet {
          updateViews()
        }
    }
    
    
    
    //MARK: - Actions
    
    @IBAction func completionButtonTapped(_ sender: Any) {
        guard let delegate = delegate else {return}
        delegate.taskCellButtonTapped(self)
    }
    func updateViews() {
        guard let task = task else {return}
        taskNameLabel.text = task.name
        if task.isComplete {
            completionButtion.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        
        } else {
            completionButtion.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    
    }


}//End of Class
