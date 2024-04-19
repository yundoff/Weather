//
//  MainAssembly.swift
//  weather
//
//  Created by Aleksey Yundov on 23.04.2024.
//

import UIKit

enum MainAssembly {
    
    static func assembly() -> UIViewController {
        let presenter = MainPresenter()
        let controller = MainViewController(presenter: presenter)
        
        presenter.controller = controller
        
        return controller
    }
}
