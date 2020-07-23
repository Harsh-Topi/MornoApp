//
//  WeatherModel.swift
//  morno test
//
//  Created by Harsh Topiwala on 2020-07-23.
//  Copyright © 2020 Harsh Topiwala. All rights reserved.
//

import Foundation

// using this struct to hold the important information about the weather
struct WeatherModel {
    
    // stored properties
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let temp_high: Double
    let temp_low: Double
    
    var temperatureString: String {
        return "Currently \(temperature) degrees Celsius in \(cityName) your city. High of \(temp_high), low of \(temp_low)"
    }
    
    // computed properties
    var conditionName: String {
         switch conditionId {
                   
                   case 200...232:
                       return "cloud.bolt"
                   case 300...321:
                       return "cloud.drizzle"
                   case 500...531:
                       return "cloud.rain"
                   case 600...622:
                       return "cloud.snow"
                   case 701...781:
                       return "cloud.fog"
                   case 800:
                       return "sun.max"
                   case 801...804:
                       return "cloud.sun"
               
               default:
                   return "cloud"
               }
    }
    
    
}
