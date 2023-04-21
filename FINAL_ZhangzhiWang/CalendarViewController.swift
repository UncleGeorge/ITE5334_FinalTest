//
//  CalendarViewController.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-21.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.appearance.headerTitleColor = UIColor.gray
        
        calendar.appearance.weekdayTextColor = UIColor.gray
    }

}

