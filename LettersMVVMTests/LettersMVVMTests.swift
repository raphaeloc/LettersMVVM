//
//  LettersMVVMTests.swift
//  LettersMVVMTests
//
//  Created by Raphael Oliveira Chagas on 11/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import XCTest
@testable import LettersMVVM

class LettersMVVMTests: XCTestCase {
    
    let defaultIndexPath = IndexPath(row: 0, section: 0)
    
    var navigationController: UINavigationControllerStub!
    var letter: Letter!
    var lettersModel: LettersModel!

    override func setUp() {
        navigationController = UINavigationControllerStub()
        letter = Letter(character: "unit test", description: "unit test")
        lettersModel = LettersModel(letters: [letter])
    }

    override func tearDown() {
        navigationController.pushedViewControllerForTests = nil
        navigationController.presentedViewControllerForTests = nil
        navigationController = nil
    }
}
