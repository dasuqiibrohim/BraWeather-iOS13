//
//  WeatherData.swift
//  BraWeather
//
//  Created by Ibrohim Dasuqi on 04/04/21.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
