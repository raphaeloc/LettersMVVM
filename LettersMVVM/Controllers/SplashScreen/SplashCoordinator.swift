//
//  SplashCoordinator.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 14/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

class SplashCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with presentation: PresentationStyle) {
        let vc = SplashViewController()
        vc.coordinator = self
        
        switch presentation {
        case .push(let animated):
            navigationController.pushViewController(vc, animated: animated)
        case .present(let animated, let completion):
            navigationController.present(vc, animated: animated, completion: completion)
        }
    }
    
    func openLettersScreen() {
        let coordinator = LettersCoordinator(navigationController: navigationController)
        coordinator.start(with: .push(animated: true))
    }
}
