//
//  EntryViewController.swift
//  ToDoList
//
//  Created by Alexey Grebennikov on 5.03.22.
//

import UIKit

class EntryViewController: UIViewController {
    
    // MARK: - Properties
    
    var update: (() -> Void)?
    
    // MARK: - IBOutlets
    
    @IBOutlet var field: UITextField!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

         field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    

    // MARK: - Methods

    @objc func saveTask() {
        
        guard let text = field.text, !text.isEmpty else { return }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else { return }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        update?()
        
        navigationController?.popViewController(animated: true)
    }

}

// MARK: - UITextFieldDelegate
extension EntryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }
}
