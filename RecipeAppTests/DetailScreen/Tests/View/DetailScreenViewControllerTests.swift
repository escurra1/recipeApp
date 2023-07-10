//
//  DetailScreenViewControllerTests.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp
import XCTest

class DetailScreenViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: DetailScreenViewController!
    var spyPresenter: DetailScreenPresenterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupDetailScreenViewController()
    }
    
    override func tearDown() {
        spyPresenter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupDetailScreenViewController() {
        sut = DetailScreenViewController()
        spyPresenter = DetailScreenPresenterProtocolSpy()
        sut.presenter = spyPresenter
    }
    
    // MARK: Tests
    func testViewDidLoad() {
        // Given
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertNoThrow(sut.viewDidLoad())
        XCTAssertNotNil(sut, "sut should be instantiated")
    }
    
    func testDidTapUbication() {
        // Given
        let buttonAction = UIButton()
        // When
        sut.didTapUbication(buttonAction)
        // Then
        XCTAssertTrue(spyPresenter.didGoToUbication)
        XCTAssertNoThrow(sut.didTapUbication(buttonAction), "didTapUbication executed")
    }
    
    func testDidTapBack() {
        // Given
        let buttonAction = UIButton()
        // When
        sut.didTapBack(buttonAction)
        // Then
        XCTAssertTrue(spyPresenter.didGoToBack)
        XCTAssertNoThrow(sut.didTapBack(buttonAction), "didTapBack executed")
    }
}
