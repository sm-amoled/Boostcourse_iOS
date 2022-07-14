//
//  ImageZoomViewController.swift
//  Ch4_Album
//
//  Created by Park Sungmin on 2022/07/15.
//

import Foundation
import UIKit
import Photos

class ImageZoomViewController: UIViewController, UIScrollViewDelegate {
    var asset: PHAsset!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    @IBOutlet weak var imageView: UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    override func viewDidLoad() {
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                  contentMode: .aspectFill,
                                  options: nil) { image, _ in
                                    self.imageView.image = image
        }
    }
}
