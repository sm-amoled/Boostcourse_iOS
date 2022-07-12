//
//  SignUpSecondViewController.swift
//  Ch2_SignUp
//
//  Created by Park Sungmin on 2022/07/10.
//

import Foundation
import UIKit
import PhotosUI

class SignUpSecondViewController: UIViewController, UITextFieldDelegate, PHPickerViewControllerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var checkpwTextField: UITextField!
//    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pwTextField.delegate = self
        checkpwTextField.delegate = self
        nextBtn.isEnabled = false
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImageView(gestureRecognizer:)))
        self.profileImageView.addGestureRecognizer(imageTapGestureRecognizer)
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        if pwTextField.text == checkpwTextField.text {
            nextBtn.isEnabled = true
        }
    }
    
    lazy var PHImagePicker: PHPickerViewController = {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        return picker
    }()
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    guard let selectedImage = image as? UIImage else { return }
                    self.profileImageView.image = selectedImage
                }
            }
        }
    }
    
    
    @IBAction func nextButtonTapped() {
        UserRegisterInformation.shared.id = idTextField.text
        UserRegisterInformation.shared.password = pwTextField.text
        UserRegisterInformation.shared.description = descriptionTextField.text
        
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "secondInfoViewController") else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func cancelButtonTapped() {
        UserRegisterInformation.shared.id = nil
        UserRegisterInformation.shared.password = nil
        UserRegisterInformation.shared.description = nil
        
        self.navigationController?.popViewController(animated: true) // 이전 화면으로 가기
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        print("view tapped")
        self.view.endEditing(true)
    }
    
    @objc func tapImageView(gestureRecognizer: UIGestureRecognizer) {
        print("image tapped")
        self.present(PHImagePicker, animated: true)
    }
}
