//
//  LetterDetailViewModelTests.swift
//  LettersMVVMTests
//
//  Created by Raphael Oliveira Chagas on 13/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import Foundation
import XCTest
@testable import LettersMVVM

class LetterDetailViewModelTests: LettersMVVMTests {
    
    var sut: LetterDetailViewModel!
    
    override func setUp() {
        super.setUp()
        sut = LetterDetailViewModel(letter: letter)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testSetup() {
        let vc = LetterDetailViewController(viewModel: sut)
        vc.loadView()
        sut.setup(view: vc)
        XCTAssertEqual(sut.letter.character, vc.letterLabel.text)
        XCTAssertEqual(sut.letter.description, vc.descriptionLabel.text)
    }
}
