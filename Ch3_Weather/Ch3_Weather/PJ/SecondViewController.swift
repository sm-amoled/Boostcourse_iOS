//
//  SecondViewController.swift
//  Ch3_Weather
//
//  Created by Park Sungmin on 2022/07/13.
//

import Foundation
import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var countryName: String = ""
    var countryAssetName: String = ""
    let cellIdentifier = "weatherCell"
    var weathers: [Weather] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WeatherCell
        
        let weather: Weather = weathers[indexPath.row]
        
        cell.city = weather.city_name
        cell.weather = weather
        cell.cityName.text = weather.city_name
        cell.thermo.text = weather.thermo
        cell.rainProbabiliy.text = weather.rainProbability
        cell.weatherImage.image = UIImage(named: weather.imageAsset)
        
        cell.thermo.textColor = weather.celsius > 10 ? .black : .blue
        cell.rainProbabiliy.textColor = weather.rainfall_probability > 50 ? .orange : .black
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = countryName

        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: countryAssetName) else { return }
        
        do {
            self.weathers = try jsonDecoder.decode([Weather].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: ThirdViewController = segue.destination as? ThirdViewController else { return }
        
        guard let cell: WeatherCell = sender as? WeatherCell else { return }
        
        nextViewController.weather = cell.weather
        nextViewController.city = cell.city
    }
    
}

struct Weather: Codable {
    let city_name: String
    let state: Int
    let celsius: Float
    let rainfall_probability: Int
    
    var thermo: String {
        return "섭씨 \(celsius)도 / 화씨 \(round((celsius * 1.8 + 32)*10)/10)도"
    }
    
    var rainProbability: String {
        return "강수확률 \(rainfall_probability)%"
    }
    
    var imageAsset: String {
        switch state {
        case 10:
            return "rainy"
        case 11:
            return "cloudy"
        case 12:
            return "sunny"
        case 13:
            return "snowy"
        default:
            return ""
        }
    }
    
    var weatherToString: String {
        switch state {
        case 10:
            return "비"
        case 11:
            return "구름"
        case 12:
            return "맑음"
        case 13:
            return "눈"
        default:
            return ""
        }
    }
}

class WeatherCell: UITableViewCell {
    var weather: Weather?
    var city: String?
    
    @IBOutlet var cityName: UILabel!
    @IBOutlet var thermo: UILabel!
    @IBOutlet var rainProbabiliy: UILabel!
    @IBOutlet var weatherImage: UIImageView!
}
