//
//  ViewController.swift
//  ToDoList
//
//  Created by Alexey Grebennikov on 5.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var tasks = [String]()
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        
        // Get all current saved tasks
        updateTasks()
        
    }
    
    // MARK: - Methods
    
    func updateTasks() {
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else { return }
        
        for i in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(i + 1)") as? String {
                tasks.append(task)
            }
            
        }
        tableView.reloadData()
        
    }
    
    // MARK: - Actions
    
    @IBAction func didTapAdd(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as? EntryViewController else { return }
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    


}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "task") as? TaskViewController else { return }
        vc.title = "New Task"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    
        
    }
}
