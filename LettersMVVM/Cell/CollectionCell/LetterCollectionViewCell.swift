//
//  LetterCollectionViewCell.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 11/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

class LetterCollectionViewCell: UICollectionViewCell, CellProtocol {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var letterLabel: UILabel!
    
    func layoutCell() {
        applyShadowAndBorder(view: shadowView)
        applyShadowAndBorder(view: holderView)
    }
}
