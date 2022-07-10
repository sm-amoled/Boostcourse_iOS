//
//  DatePickerViewController.swift
//  Ch2_SignUp
//
//  Created by Park Sungmin on 2022/07/10.
//

import Foundation
import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
//        formatter.dateStyle = .long
//        formatter.timeStyle = .long
        formatter.dateFormat = "yyyy/mm/dd hh:mm:ss"
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateLabel.text = dateFormatter.string(from:Date())
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
    }
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value changed")
        let date: Date = self.datePicker.date
        
        
        self.dateLabel.text = dateFormatter.string(from: date)
    }
    
}
