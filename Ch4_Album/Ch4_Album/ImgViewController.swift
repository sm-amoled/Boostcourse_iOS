//
//  ImgViewController.swift
//  Ch4_Album
//
//  Created by Park Sungmin on 2022/07/14.
//

import Foundation
import UIKit

class imgViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
        // https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg
        var imageData: Data?
        
        guard let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg") else {
            print("유효한 URL이 아님")
            return
        }
        
        OperationQueue.main.addOperation {
            do {
                
                // 동기 함수 ... 함수 실행을 종료할 때 까지 멈춰있음
                imageData = try Data.init(contentsOf: imageURL)
                self.imageView.image = UIImage(data: imageData!)
                
            } catch {
                print("data 호출 실패")
                return
            }
        }
    }
}
