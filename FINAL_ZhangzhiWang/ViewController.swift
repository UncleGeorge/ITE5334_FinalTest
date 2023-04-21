//
//  ViewController.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-18.
//

import UIKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustFontSize()

        let fbLoginButton = FBLoginButton()
//        loginButton.center = view.center
        fbLoginButton.frame = loginButton.frame
        
        loginButton.removeFromSuperview()

        view.addSubview(fbLoginButton)
    }
    
}

