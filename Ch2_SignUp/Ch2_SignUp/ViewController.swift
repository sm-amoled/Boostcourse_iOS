//
//  ViewController.swift
//  Ch2_SignUp
//
//  Created by Park Sungmin on 2022/07/10.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
//        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.delegate = self
        
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func touchUpSetButton(_ sender: UIButton) {
        UserInformation.shared.name = nameField.text
        UserInformation.shared.age = ageField.text
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        print("tapped")
        self.view.endEditing(true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("tapped")
        self.view.endEditing(true)
        return true
    }
}
