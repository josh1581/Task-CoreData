//
//  TaskController.swift
//  TaskCoreData
//
//  Created by Joshua Hoyle on 4/27/21.
//

import CoreData

class TaskController {
    
    //MARK: - Properties
    
    static let sharedInstance = TaskController()
    //SOT
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
        
    }()
    
    //MARK: - Functions
    
    func creatTaskWith(name: String, notes: String?, dueDate: Date?) {
        let task = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(task)
        CoreDataStack.saveContext()
        
    }
    func fetchTasks() {
        let fetchedTasks = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        tasks = fetchedTasks
    }
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        CoreDataStack.saveContext()
    }
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        CoreDataStack.saveContext()
    }
    
}//end of class

