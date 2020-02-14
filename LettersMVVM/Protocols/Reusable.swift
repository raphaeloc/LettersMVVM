//
//  Reusable.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 11/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import Foundation

protocol Reusable {

}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}
