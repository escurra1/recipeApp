//
//  MapScreenRouterTests.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp
import XCTest

class MapScreenRouterTests: XCTestCase {
    // MARK: Subject under test
    var sut: MapScreenRouterProtocol!
    var currentViewController: MapScreenViewController!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupMapScreenRouter()
    }
    
    override func tearDown() {
        sut = nil
        currentViewController = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupMapScreenRouter() {
        currentViewController = MapScreenViewController()
        sut = MapScreenRouter(view: currentViewController)
    }
    
    // MARK: - Tests
    func testRouteToBack() {
        // Given
        // When
        sut.routeToBack()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToBack(), "routeToBack executed")
    }
}
