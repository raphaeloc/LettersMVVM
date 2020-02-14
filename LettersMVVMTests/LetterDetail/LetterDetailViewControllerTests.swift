//
//  LetterDetailViewControllerTests.swift
//  LettersMVVMTests
//
//  Created by Raphael Oliveira Chagas on 13/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import Foundation
import XCTest
@testable import LettersMVVM

class LetterDetailViewControllerTests: LettersMVVMTests {
    
    var sut: LetterDetailViewController!
    var viewModel: LetterDetailViewModelStub!
    
    override func setUp() {
        super.setUp()
        viewModel = LetterDetailViewModelStub(letter: letter)
        sut = LetterDetailViewController(viewModel: viewModel)
        navigationController = UINavigationControllerStub(rootViewController: sut)
        sut.loadView()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testViewWillAppear() {
        sut.viewWillAppear(false)
        XCTAssertFalse(sut.navigationController?.isNavigationBarHidden ?? true)
    }
    
    func testViewDidLoad() {
        viewModel.expectation = expectation(description: "should call setup")
        sut.viewDidLoad()
        wait(for: [viewModel.expectation!], timeout: 0.5)
    }
}

final class LetterDetailViewModelStub: LetterDetailViewModel {
    
    var expectation: XCTestExpectation?
    
    override func setup(view: LetterDetailViewController) {
        expectation?.fulfill()
    }
}
