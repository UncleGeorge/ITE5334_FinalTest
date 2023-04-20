//
//  ToDoViewController.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-19.
//

import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var todos: [(text: String, icon: String)] = [
            ("Daily Meeting with the team", "orangeRing"),
            ("Completing the prototype", "check"),
            ("Find people for the user test", "orangeRing"),
            ("Buy cookies for the kids", "blueRing"),
            ("Pay electricity bill", "redRing")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "TodoTableViewCell", bundle: nil), forCellReuseIdentifier: "TodoTableViewCell")
    }

}

extension ToDoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        
        cell.itemLabel.text = todos[indexPath.row].text
        cell.itemIcon.image = UIImage(named: todos[indexPath.row].icon)
        
        return cell
    }
}


extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("Selected row at index: \(indexPath.row)")
    }
    
}
