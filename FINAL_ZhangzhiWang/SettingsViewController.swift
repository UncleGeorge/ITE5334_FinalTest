//
//  SettingsViewController.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var increaseFontSwitch: UISwitch!
    @IBOutlet weak var soundEffectSwitch: UISwitch!
    
    @IBOutlet weak var increaseFontLabel: UILabel!
    @IBOutlet weak var soundEffectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustFontSize()
        
        // Set the switches according to the data in UserDefaults
        increaseFontSwitch.isOn = UserDefaults.standard.bool(forKey: "increaseFontSizeEnabled")
        soundEffectSwitch.isOn = UserDefaults.standard.bool(forKey: "soundEffectEnabled")
        
        increaseFontLabel.text = increaseFontSwitch.isOn ? "Active" : "Inactive"
        soundEffectLabel.text = soundEffectSwitch.isOn ? "Active" : "Inactive"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SoundManager.shared.playClickSound()
    }
    
    // Update UserDefaults when switch changes
    @IBAction func increaseFontSwitchChanged(_ sender: UISwitch) {
        
        SoundManager.shared.playClickSound()
        
        UserDefaults.standard.set(sender.isOn, forKey: "increaseFontSizeEnabled")
        if sender.isOn {
            increaseFontLabel.text = "Active"
        } else {
            increaseFontLabel.text = "Inactive"
        }
        
        // Remind users restart the app after changing the font size
        let alertController = UIAlertController(title: "Restart Required", message: "You need to restart the app for the new font size to take effect.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func soundEffectSwitchChanged(_ sender: UISwitch) {
        
        SoundManager.shared.playClickSound()
        
        UserDefaults.standard.set(sender.isOn, forKey: "soundEffectEnabled")
        if sender.isOn {
            soundEffectLabel.text = "Active"
        } else {
            soundEffectLabel.text = "Inactive"
        }
    }
    
    
}
