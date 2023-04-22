//
//  NewReminderViewController.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-20.
//

import UIKit

// Pass new reminder data to classes that implement the protocol
protocol NewReminderDelegate {
    func addNewReminder(data: String)
}

class NewReminderViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    var delegate: NewReminderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.setCursorOffset(offset: 20)
        adjustFontSize()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        SoundManager.shared.playClickSound()
    }
    

    @IBAction func submitClicked(_ sender: UIButton) {
        
        SoundManager.shared.playClickSound()
        
        // Remind the user if Reminder Name is empty
        guard let textFieldContent = nameTextField.text, !textFieldContent.isEmpty else {
            
            let alertController = UIAlertController(title: "Missing Information", message: "Reminder Name cannot be empty.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        // Return the data and pop the current page
        delegate?.addNewReminder(data: textFieldContent)
        navigationController?.popViewController(animated: true)
    }

}
