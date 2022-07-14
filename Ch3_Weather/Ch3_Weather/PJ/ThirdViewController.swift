//
//  ThirdViewController.swift
//  Ch3_Weather
//
//  Created by Park Sungmin on 2022/07/14.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    var weather: Weather?
    var city: String?
    
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var thermoLabel: UILabel!
    @IBOutlet var rainProbLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = city
         
        guard let weather = weather else {
            return
        }
       
        weatherImage.image = UIImage(named: weather.imageAsset)
        weatherLabel.text = weather.weatherToString
        thermoLabel.text = weather.thermo
        rainProbLabel.text = weather.rainProbability
        
        thermoLabel.textColor = weather.celsius > 10 ? .black : .blue
        rainProbLabel.textColor = weather.rainfall_probability > 50 ? .orange : .black
        
    }
    
}
