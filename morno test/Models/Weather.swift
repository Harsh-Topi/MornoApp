//
//  Weather.swift
//  MornoApp
//
//  Created by Harsh Topiwala on 2020-07-09.
//
//

// this weather model only used for structuring what json data is going to be parsed
import Foundation

struct Weather: Codable {
    let name: String
    let main: Main
    let weather: [WeatherDesc]
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let feels_like: Double
}

struct WeatherDesc: Codable {
    let description: String
    let id: Int
}

