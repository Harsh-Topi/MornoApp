//
//  WeatherManager.swift
//  Clima
//
//  Created by Harsh Topiwala on 2020-07-09.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

// protocol for the weather manager, for the delegate
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

// calling methods to do the parsing of all the information
struct WeatherManager {
    
    // need to use https to make secure connections
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=85c636f75f8b19f759594e00ea8d2275&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    // function that takes in a search query and performs a request
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
         let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
         performRequest(with: urlString)
     }
    
    func performRequest(with urlString: String) {
        
        // make url
        if let url = URL(string: urlString) {
            
            // create session
            let session = URLSession(configuration: .default)
            
            // give task to session
            let task = session.dataTask(with: url) { (data, response, error) in
                if (error != nil) {
                    self.delegate?.didFailWithError(error: error!)
                    return // exit out of this function and dont continue
                }
                
                if let safeData = data {
                    // convert to string
                    if let weather = self.parsejson(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                        
                    }
                }
            }
            
            // start the task
            task.resume()
            
            
        }
        
    }
    
    // parsing the json data from the api
    func parsejson(_ weatherData: Data) -> WeatherModel? {
        
        let decoder = JSONDecoder()
        //.self turns weatherdata to datatype
        
        do {
            // calling the decoder to decode data into type weather
            let decodedData = try decoder.decode(Weather.self, from: weatherData)
            
            // setting variables for the decoded data (decoded data is of type weather, so we can access its stuff)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let temp_high = decodedData.main.temp_max
            let temp_low = decodedData.main.temp_min
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, temp_high: temp_high, temp_low: temp_low)
            
            return weather
            
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        
    }

}
