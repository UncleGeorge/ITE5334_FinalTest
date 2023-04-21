//
//  NewReminderViewController.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-20.
//

import UIKit

protocol NewReminderDelegate {
    func addNewReminder(data: String)
}

class NewReminderViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    var delegate: NewReminderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustFontSize()

    }
    

    @IBAction func submitClicked(_ sender: UIButton) {
        
        SoundManager.shared.playClickSound()
        
        guard let textFieldContent = nameTextField.text, !textFieldContent.isEmpty else {
            return
        }
        
        delegate?.addNewReminder(data: textFieldContent)
        navigationController?.popViewController(animated: true)
    }

}
