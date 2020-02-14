//
//  LettersCoordinator.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 11/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

class LettersCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with presentation: PresentationStyle) {
        let vc = LettersViewController(viewModel: LettersViewModel())
        vc.coordinator = self
        
        switch presentation {
            
        case .push(let animated):
            navigationController.pushViewController(vc, animated: animated)
        case .present(let animated, let completion):
            navigationController.present(vc, animated: animated, completion: completion)
        }
    }
    
    func openDetails(letter: Letter) {
        let coordinator = LetterDetailCoordinator(navigationController: navigationController, letter: letter)
        coordinator.start(with: .push(animated: true))
    }
}
