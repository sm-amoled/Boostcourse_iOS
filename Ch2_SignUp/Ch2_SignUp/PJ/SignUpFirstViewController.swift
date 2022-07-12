//
//  SignUpFirstViewController.swift
//  Ch2_SignUp
//
//  Created by Park Sungmin on 2022/07/10.
//

import Foundation
import UIKit

class SignUpFirstViewController: UIViewController {
    @IBAction func tapSignUpButton() {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "firstInfoViewController") else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
