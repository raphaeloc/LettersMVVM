//
//  LetterDetailCoordinatorTests.swift
//  LettersMVVMTests
//
//  Created by Raphael Oliveira Chagas on 13/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import Foundation
import XCTest
@testable import LettersMVVM

class LetterDetailCoordinatorTests: LettersMVVMTests {
    
    var sut: LetterDetailCoordinator!
    
    override func setUp() {
        super.setUp()
        sut = LetterDetailCoordinator(navigationController: navigationController, letter: letter)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testInit() {
        XCTAssertEqual(sut.navigationController, navigationController)
    }
    
    func testStartWithPush() {
        sut.start(with: .push(animated: false))
        XCTAssertNotNil(navigationController.pushedViewControllerForTests as? LetterDetailViewController)
    }
    
    func testStartWithPresent() {
        sut.start(with: .present(animated: false, completion: nil))
        XCTAssertNotNil(navigationController.presentedViewControllerForTests as? LetterDetailViewController)
    }
}
