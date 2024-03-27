//
//  TodoViewController.swift
//  MyUIKit
//
//  Created by 최낙주 on 3/27/24.
//

import UIKit

struct TodoItem {
    let title: String
    var isCompleted: Bool
}

class TodoViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    var data: [TodoItem] = [
        TodoItem(title: "커밋하기", isCompleted: false),
        TodoItem(title: "운동하기", isCompleted: true),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        todoTableView.backgroundColor = .brown
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
}

extension TodoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myAction = UIContextualAction(style: .normal, title: "완료") { action, view, completionHandler in
            self.data[indexPath.row].isCompleted.toggle()
            
            self.todoTableView.reloadData()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [myAction])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        
        if data[indexPath.row].isCompleted {
            cell.textLabel?.textColor = .green
            cell.imageView?.image = UIImage(systemName: "checkmark.rectangle.fill")
        } else {
            cell.textLabel?.textColor = .red
            cell.imageView?.image = UIImage(systemName: "checkmark.rectangle")
        }
        return cell
    }
    
    
}
