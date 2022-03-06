//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Alexey Grebennikov on 5.03.22.
//

import UIKit

class TaskViewController: UIViewController {
    
    // MARK: - Properties
    
    var task: String?
    
    // MARK: - IBOulet
    
    @IBOutlet var label: UILabel!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    

    // MARK: - Methods
    
    @objc func deleteTask() {
        
//        let newCount = count - 1
//        
//        UserDefaults().set(newCount, forKey: "count")
//        UserDefaults().set(nil, forKey: "task_\(currentPosition)")
        
        
        
    }


}
