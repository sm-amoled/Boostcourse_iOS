//
//  PracticeController.swift
//  Ch2_SignUp
//
//  Created by Park Sungmin on 2022/07/10.
//

import Foundation
import UIKit
import PhotosUI

class PracticeController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func touchUpSelectImageButton(_ sender: UIButton) {
        self.present(self.PHImagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        print("Tapped")
    }
    
    // MARK: UIImagePicker
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        picker.delegate = self
        
        return picker
    }()
    
    // UIImagePicker에 대한 Delegate ... 취소한 경우
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // UIImagePicker에 대한 Delegate ... 사진을 선택한 경우
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: PHImagePicker
    lazy var PHImagePicker: PHPickerViewController = {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        return picker
    }()
    
    // PHImagePicker에 대한 Delegate ... 사진을 선택한 경우 + 취소를 누른 경우 모두에 대응
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    guard let selectedImage = image as? UIImage else { return }
                    self.imageView.image = selectedImage
                }
            }
        }
    }
}
