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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustFontSize()
        
        increaseFontSwitch.isOn = UserDefaults.standard.bool(forKey: "increaseFontSizeEnabled")
        soundEffectSwitch.isOn = UserDefaults.standard.bool(forKey: "soundEffectEnabled")
    }
    
    
    @IBAction func increaseFontSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "increaseFontSizeEnabled")
    }
    
    @IBAction func soundEffectSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "soundEffectEnabled")
    }
    
    
}
