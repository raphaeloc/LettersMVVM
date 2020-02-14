//
//  LettersViewModel.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 11/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

class LettersViewModel {
    
    let resourceName = "letters"
    let extensionType = "json"
    
    func getLetters() -> LettersModel {
        
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: extensionType),
            let data = try? Data(contentsOf: url),
            let jsonData = try? JSONDecoder().decode(LettersModel.self, from: data) else { fatalError() }
        
        return jsonData
    }
    
    func getRandomColor() -> UIColor {
        let allCollors = UIColor.getAllColors()
        let random = Int.random(in: 0..<allCollors.count)
        return allCollors[random]
    }
}
