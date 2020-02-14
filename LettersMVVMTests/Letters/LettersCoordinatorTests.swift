//
//  LettersCoordinatorTests.swift
//  LettersMVVMTests
//
//  Created by Raphael Oliveira Chagas on 12/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import Foundation
import XCTest
@testable import LettersMVVM

class LettersCoordinatorTests: LettersMVVMTests {
    
    var sut: LettersCoordinator!
    
    override func setUp() {
        super.setUp()
        sut = LettersCoordinator(navigationController: navigationController)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testInit() {
        sut = LettersCoordinator(navigationController: navigationController)
        XCTAssertEqual(sut.navigationController, navigationController)
    }
    
    func testStartWithPush() {
        sut.start(with: .push(animated: false))
        XCTAssertNotNil(navigationController.pushedViewControllerForTests as? LettersViewController)
    }
    
    func testStartWithPresent() {
        sut.start(with: .present(animated: false, completion: {
            XCTAssertNotNil(self.navigationController.presentedViewControllerForTests as? LettersViewController)
        }))
    }
    
    func testOpenDetails() {
        sut.openDetails(letter: letter)
        XCTAssertNotNil(navigationController.pushedViewControllerForTests as? LetterDetailViewController)
    }
}
