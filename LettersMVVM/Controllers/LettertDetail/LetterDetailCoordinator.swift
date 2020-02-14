//
//  LetterDetailCoordinator.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 12/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

class LetterDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var letter: Letter
    
    init(navigationController: UINavigationController, letter: Letter) {
        self.navigationController = navigationController
        self.letter = letter
    }
    
    func start(with presentation: PresentationStyle) {
        let viewModel = LetterDetailViewModel(letter: letter)
        let vc = LetterDetailViewController(viewModel: viewModel)
        
        switch presentation {
            
        case .push(let animated):
            navigationController.pushViewController(vc, animated: animated)
        case .present(let animated, let completion):
            navigationController.present(vc, animated: animated, completion: completion)
        }
    }
}
