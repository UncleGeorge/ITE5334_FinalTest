//
//  FinanceViewController.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-20.
//

import UIKit

class FinanceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movements: [(title: String, icon: String, description: String, amount: String)] = [
            ("John Doe", "blueBall", "Incoming payment | 10.01.2021", "+1000€"),
            ("Amazon", "orangeBall", "Outgoing payment | 10.01.2021", "-2500€"),
            ("Ikea", "orangeBall", "Outgoing payment | 10.01.2021", "-15000€"),
            ("Mc Donalds NYC", "orangeBall", "Outgoing payment | 10.01.2021", "-1500€")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustFontSize()

        tableView.separatorStyle = .none
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "FinanceTableViewCell", bundle: nil), forCellReuseIdentifier: "FinanceTableViewCell")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNewAmount" {
            let destinationVC = segue.destination as! NewAmountViewController
            destinationVC.delegate = self
        }
    }

}

extension FinanceViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FinanceTableViewCell", for: indexPath) as! FinanceTableViewCell
        
        cell.itemTitle.text = movements[indexPath.row].title
        cell.itemIcon.image = UIImage(named: movements[indexPath.row].icon)
        cell.itemDesc.text = movements[indexPath.row].description
        cell.itemAmount.text = movements[indexPath.row].amount
        
        return cell
    }
}


extension FinanceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        SoundManager.shared.playClickSound()
    }
    
}

extension FinanceViewController: NewAmountDelegate {
    func addNewAmount(data: (name: String, amount: Int)) {
        movements.append((data.name, "orangeBall", "Outgoing payment | 10.01.2021", "-\(data.amount)€"))
        tableView.reloadData()
    }
}

