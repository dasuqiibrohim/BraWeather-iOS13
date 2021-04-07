//
//  ViewController.swift
//  BraWeather
//
//  Created by Ibrohim Dasuqi on 30/03/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var searchBarCity: UISearchBar!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchBarCity.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

//MARK: - Weather Manager Delegate
extension ViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async { [self] in
            labelTemp.text = weather.temperatureString
            imageWeather.image = UIImage(systemName: weather.conditionName)
            labelCity.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        searchBarCity.placeholder = "Type the correct city name."
    }
}

//MARK: - Search Bar Delegate
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let city = searchBar.text {
            weatherManager.fetchWeather(cityName: city)
        } else {
            searchBar.placeholder = "Type Something."
        }
        searchBarCity.endEditing(true)
    }
}

//MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    //MARK: - Button Action
    @IBAction func ButtonGetLocationClick(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}
