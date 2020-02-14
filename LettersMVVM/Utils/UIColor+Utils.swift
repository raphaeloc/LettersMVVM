//
//  UIColor+Utils.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 14/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

extension UIColor {

    static func getAllColors() -> [UIColor] {

        return [
            UIColor.black.withAlphaComponent(0.50),
            UIColor.white.withAlphaComponent(0.50),
            UIColor.red.withAlphaComponent(0.50),
            UIColor.blue.withAlphaComponent(0.50),
            UIColor.green.withAlphaComponent(0.50),
            UIColor.gray.withAlphaComponent(0.50),
            UIColor.cyan.withAlphaComponent(0.50),
            UIColor.purple.withAlphaComponent(0.50),
            UIColor.yellow.withAlphaComponent(0.50),
            UIColor.magenta.withAlphaComponent(0.50),
            UIColor.orange.withAlphaComponent(0.50),
            UIColor.brown.withAlphaComponent(0.50)
        ]
    }
}

