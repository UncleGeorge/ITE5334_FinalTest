//
//  NewAmountViewController.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-20.
//

import UIKit

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
        adjustFontSize()
    }
    
    
    @IBAction func amountSliderChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        
        amountLabel.text = "\(currentValue)€"
    }
    
    @IBAction func submitClicked(_ sender: UIButton) {
        
        SoundManager.shared.playClickSound()
        
        guard let textFieldContent = nameTextField.text, !textFieldContent.isEmpty else {
            return
        }
        
        delegate?.addNewAmount(data: (textFieldContent, Int(amountSlider.value)))
        navigationController?.popViewController(animated: true)
    }
}
