//
//  FirstViewController.swift
//  Ch3_Weather
//
//  Created by Park Sungmin on 2022/07/13.
//

import Foundation
import UIKit

class FirstViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let cellIdentifier = "CountryCell"
    
    var countries: [Country] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CountryCell
        
        let country = countries[indexPath.row]
        
        cell.countryNameLabel.text = country.koreanName
        cell.flagImage.image = UIImage(named: "flag_\(country.assetName)")
        cell.countryName = country.koreanName
        cell.assetName = country.assetName
        
        return cell
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "세계 날씨"
        
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "countries") else { return }
        
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else { return }
        
        guard let cell: CountryCell = sender as? CountryCell else { return }
        
        nextViewController.countryAssetName = cell.assetName
        nextViewController.countryName = cell.countryName
    }
}


struct Country: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}

class CountryCell: UITableViewCell {
    var countryName: String = ""
    var assetName: String = ""
    
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var countryNameLabel: UILabel!
}
