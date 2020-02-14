//
//  CellProtocol.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 12/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

protocol CellProtocol: Reusable {
    
    func layoutCell()
}

extension CellProtocol {
    
    func applyShadowAndBorder(view: UIView) {
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor(red: 91 / 255.0, green: 81 / 255.0, blue: 73 / 255.0, alpha: 0.20).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 2
    }
}
