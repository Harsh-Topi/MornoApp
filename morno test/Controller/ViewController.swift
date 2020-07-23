//
//  ViewController.swift
//  morno test
//
//  Created by Harsh Topiwala on 2020-07-16.
//  Copyright © 2020 Harsh Topiwala. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var weatherStatement: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var todLabel: UILabel!
    
    var weatherM = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherM.delegate = self
        locationManager.delegate = self
        
        // shows a popup on screen
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        // says textfield should report back to view controller
        
        
    }
}


// MARK: - WeatherManagerDelegate

// these are the default implementations that come with this view controller
extension ViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
           // we dont want this to execute in the same thread as our networking stuff
           // if in the same thread, things might not load until networking stuff is done
           // use dispatchqueue to update ui from this completion handler
           
           DispatchQueue.main.async {
               self.weatherStatement.text = weather.temperatureString
               self.weatherImg.image = UIImage(systemName: weather.conditionName)
           }
           
       }
       
       func didFailWithError(error: Error) {
           print(error)
       }
}

// MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherM.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


