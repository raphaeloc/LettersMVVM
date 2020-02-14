//
//  Coordinator.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 11/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start(with presentation: PresentationStyle)
}
