//
//  WeatherManager.swift
//  BraWeather
//
//  Created by Ibrohim Dasuqi on 04/04/21.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=07178fe4cc4f075c5c56746321dd7164&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        //print(urlString)
        performRequest(with: urlString)
    }
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        let task = URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if let safeData = data {
                parseJSON(safeData)
                //if let weather = self.parseJSON(safeData) {
                //self.delegate?.didUpdateWeather(self, weather: weather)
                //}
            } else {
                delegate?.didFailWithError(error: error!)
                return
            }
        }
        task.resume()
    }
    
    func parseJSON(_ weatherData: Data)  {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            print("id: \(id)")
            print("temp: \(temp)")
            print("name: \(name)")
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            delegate?.didUpdateWeather(self, weather: weather)
            
        } catch {
            delegate?.didFailWithError(error: error)
        }
    }
}
