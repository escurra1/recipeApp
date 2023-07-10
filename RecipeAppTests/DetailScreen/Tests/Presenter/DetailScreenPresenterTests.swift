//
//  DetailScreenPresenterTests.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp
import XCTest

class DetailScreenPresenterTests: XCTestCase {
    // MARK: Subject under test
    var sut: DetailScreenPresenter!
    var spyRouter: DetailScreenRouterProtocolSpy!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupDetailScreenPresenter()
    }
    
    override func tearDown() {
        spyRouter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupDetailScreenPresenter() {
        spyRouter = DetailScreenRouterProtocolSpy()
        sut = DetailScreenPresenter(andRouter: spyRouter)
        sut.router = spyRouter
    }
    
    // MARK: - Tests
    func testGoToUbication() {
        // Given
        // When
        sut.goToUbication()
        // Then
        XCTAssertNoThrow(sut.goToUbication(), "goToUbication executed")
        XCTAssertTrue(spyRouter.didRouteToUbication, "didRouteToUbication executed")
    }
    
    func testGoToBack() {
        // Given
        // When
        sut.goToBack()
        // Then
        XCTAssertNoThrow(sut.goToBack(), "goToBack executed")
        XCTAssertTrue(spyRouter.didRouteToBack, "didRouteToBack executed")
    }
}
