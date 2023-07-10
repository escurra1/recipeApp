//
//  MapScreenViewControllerTests.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp
import XCTest

class MapScreenViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: MapScreenViewController!
    var spyPresenter: MapScreenPresenterProtocolSpy!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupMapScreenViewController()
    }
    
    override func tearDown() {
        spyPresenter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupMapScreenViewController() {
        sut = MapScreenViewController()
        spyPresenter = MapScreenPresenterProtocolSpy()
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
