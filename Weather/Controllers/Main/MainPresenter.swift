//
//  MainPresenter.swift
//  weather
//
//  Created by Aleksey Yundov on 23.04.2024.
//

import UIKit

final class MainPresenter: MainPresenterProtocol {
    
    // MARK: - Properties
    
    weak var controller: MainControllerProtocol?
    
    // MARK: - TestViewModelProtocol
    
    /// let completion: (MainCurrentWeather) -> Void = { response in }
    /// сompletion - название переменной
    /// (MainCurrentWeather) -> Void - тип переменной
    ///  = { response in } - присваивание в переменную кложуру (реализацию функции)
    func requestCurrentWeather() {
//        let completion: (MainCurrentWeather) -> Void = { response in
//            self.controller?.display(model: response)
//        }
//        fetchFromNetwork(completion: completion) /// Передаем в функцию completion = кложуру = другую функцию
        
        fetchFromNetwork { self.controller?.display(model: $0) }
    }
    
    // MARK: - Private Methods
    
    private func fetchFromNetwork(completion: @escaping (MainCurrentWeather) -> Void) {
        let response = MainCurrentWeather(
            location: "Minsk",
            temperature: "18",
            description: "Mostly Sunny",
            image: UIImage (systemName: "sun.max")
        )
        completion(response) ///  Вызываем completion = кложуру = функцию которую ередали в качестве парамтера функции fetchFromNetwork с параметром currentWeather(свойство)
    }
}
