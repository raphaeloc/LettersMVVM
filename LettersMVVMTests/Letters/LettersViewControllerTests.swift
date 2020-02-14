//
//  LettersViewControllerTests.swift
//  LettersMVVMTests
//
//  Created by Raphael Oliveira Chagas on 12/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import Foundation
import XCTest
@testable import LettersMVVM

class LettersViewControllerTests: LettersMVVMTests {
    
    var sut: LettersViewController!
    var coordinatorStub: LettersCoordinatorStub!
    
    override func setUp() {
        super.setUp()
        sut = LettersViewController(viewModel: LettersViewModel())
        navigationController = UINavigationControllerStub(rootViewController: sut)
        coordinatorStub = LettersCoordinatorStub(navigationController: navigationController)
        sut.loadView()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testInit() {
        XCTAssertNotNil(sut.viewModel)
        XCTAssertNotNil(sut.lettersList)
    }
    
    func testViewWillAppear() {
        sut.viewWillAppear(false)
        XCTAssertTrue(sut.navigationController?.isNavigationBarHidden ?? false)
    }
    
    func testDidSelecteItemsInSection() {
        sut.coordinator = coordinatorStub
        sut.lettersList = lettersModel
        coordinatorStub.expectation = expectation(description: "should call openDetails")
        sut.collectionView(sut.collectionView, didSelectItemAt: defaultIndexPath)
        wait(for: [coordinatorStub.expectation!], timeout: 0.5)
    }
    
    func testNumberOfItemsInSection() {
        sut.lettersList = lettersModel
        let result = sut.collectionView(sut.collectionView, numberOfItemsInSection: 0)
        XCTAssertEqual(1, result)
    }
    
    func testCellForItemAt() {
        sut.lettersList = lettersModel
        let result = sut.collectionView(sut.collectionView, cellForItemAt: defaultIndexPath)
        guard let cell = result as? LetterCollectionViewCell else {
            XCTFail("should to bem LetterCollectionViewCell")
            return
        }
        XCTAssertEqual(cell.letterLabel.text, sut.lettersList.letters[defaultIndexPath.row].character)
    }
    
    func testSizeForItemAt() {
        let width: Double = 100 / 3 - 10
        let height: Double = width
        let expected = CGSize(width: width, height: height)
        sut.collectionView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let result = sut.collectionView(sut.collectionView, layout: UICollectionViewLayout(), sizeForItemAt: defaultIndexPath)
        XCTAssertEqual(expected, result)
    }
    
    func testCellForItemAtWithEqualColorOfLastCell() {
        let view = UIView()
        sut.lastMountedCell = LetterCollectionViewCell()
        sut.lastMountedCell?.holderView = view
        sut.lastMountedCell?.holderView.backgroundColor = .white
        let result = sut.collectionView(sut.collectionView, cellForItemAt: defaultIndexPath)
        guard let cell = result as? LetterCollectionViewCell else {
            XCTFail("should to be LetterCollectionViewCell")
            return
        }
        XCTAssertTrue(UIColor.getAllColors().contains(cell.holderView.backgroundColor!))
    }
    
    func testCellForItemAtWithOwnColor() {
        let result = sut.collectionView(sut.collectionView, cellForItemAt: defaultIndexPath)
        guard let cell = result as? LetterCollectionViewCell else {
            XCTFail("should to be LetterCollectionViewCell")
            return
        }
        XCTAssertTrue(UIColor.getAllColors().contains(cell.holderView.backgroundColor!))
    }
}

final class LettersCoordinatorStub: LettersCoordinator {
    
    var expectation: XCTestExpectation?
    
    override func openDetails(letter: Letter) {
        expectation?.fulfill()
    }
}
