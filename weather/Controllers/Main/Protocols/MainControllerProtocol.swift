//
//  MainControllerProtocol.swift
//  weather
//
//  Created by Aleksey Yundov on 23.04.2024.
//

import Foundation

protocol MainControllerProtocol: AnyObject {
    
    func display(model: MainCurrentWeather)
}
