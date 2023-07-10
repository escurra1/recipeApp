//
//  MapScreenPresenterTests.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp
import XCTest

class MapScreenPresenterTests: XCTestCase {
    // MARK: Subject under test
    var sut: MapScreenPresenter!
    var spyRouter: MapScreenRouterProtocolSpy!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupMapScreenPresenter()
    }
    
    override func tearDown() {
        spyRouter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupMapScreenPresenter() {
        spyRouter = MapScreenRouterProtocolSpy()
        sut = MapScreenPresenter(andRouter: spyRouter)
        sut.router = spyRouter
    }
    
    // MARK: - Tests
    func testGoToBack() {
        // Given
        // When
        sut.goToBack()
        // Then
        XCTAssertNoThrow(sut.goToBack(), "goToBack executed")
        XCTAssertTrue(spyRouter.didRouteToBack, "didRouteToBack executed")
    }
}
