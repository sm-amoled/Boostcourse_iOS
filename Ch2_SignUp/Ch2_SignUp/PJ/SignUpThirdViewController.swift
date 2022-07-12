//
//  SignUpThirdViewController.swift
//  Ch2_SignUp
//
//  Created by Park Sungmin on 2022/07/10.
//

import Foundation
import UIKit

class SignUpThirdViewController: UIViewController {
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }()
    
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dateLabel.text = formatter.string(from: Date())
    }
    
    @IBAction func tapCancelButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true) // 루트 뷰로 가기
    }
    
    @IBAction func tapBeforeButton() {
        self.navigationController?.popViewController(animated: true) // 이전 화면으로 가기
    }
    
    @IBAction func tapSignUpButton(_ sender: UIButton) {
        //레드바보
        //넌 복학하고보자
        
        UserRegisterInformation.shared.phoneNo = phoneNo.text
        UserRegisterInformation.shared.birth = datepicker.date
        
        self.navigationController?.popToRootViewController(animated: true) // 루트 뷰로 가기
    }
    
    @IBAction func changeDatePickerValue(_ sender: UIDatePicker) {
        dateLabel.text = formatter.string(from: datepicker.date)
    }
}
