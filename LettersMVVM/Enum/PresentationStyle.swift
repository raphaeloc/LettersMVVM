//
//  PresentationStyle.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 12/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import Foundation

enum PresentationStyle {
    case push(animated: Bool)
    case present(animated: Bool, completion: (() -> Void)?)
}
