//
//  NewAmountViewController.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-20.
//

import UIKit

// Pass new amount data to classes that implement the protocol
protocol NewAmountDelegate {
    func addNewAmount(data: (name: String, amount: Int))
}

class NewAmountViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountSlider: UISlider!
    
    var delegate: NewAmountDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.setCursorOffset(offset: 20)
        adjustFontSize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SoundManager.shared.playClickSound()
    }
    
    // When the amount slider moves, update the amount label
    @IBAction func amountSliderChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        
        amountLabel.text = "\(currentValue)€"
    }
    
    @IBAction func submitClicked(_ sender: UIButton) {
        
        SoundManager.shared.playClickSound()
        
        // Prevent users from entering an empty amount name
        guard let textFieldContent = nameTextField.text, !textFieldContent.isEmpty else {
            
            let alertController = UIAlertController(title: "Missing Information", message: "Amount Name cannot be empty.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        // Return the data and pop the current page
        delegate?.addNewAmount(data: (textFieldContent, Int(amountSlider.value)))
        navigationController?.popViewController(animated: true)
    }
}
