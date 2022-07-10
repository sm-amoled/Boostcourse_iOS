//
//  SecondViewController.swift
//  Ch2_SignUp
//
//  Created by Park Sungmin on 2022/07/10.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = UserInformation.shared.name
        ageLabel.text = UserInformation.shared.age
    }
    
    
    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
}
