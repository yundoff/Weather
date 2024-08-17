//
//  MainCurrentWeather.swift
//  weather
//
//  Created by Aleksey Yundov on 23.04.2024.
//

import UIKit

struct MainCurrentWeather {
    
    let location: String
    let temperature: String
    let description: String
    let image: UIImage?
}

struct MainResponse {
    
    let currentWeather: CurrentWeather
    let hourlyForecast: [HourlyForecastItem]
}

extension MainResponse {
    
    struct CurrentWeather {
        
        let location: String
        let temperature: String
        let description: String
        let image: UIImage?
    }
    
    struct HourlyForecastItem {
        
        let temperature: String
        let time: String
        let image: UIImage?
    }
}
