//
//  DetailScreenRouterTests.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp
import XCTest

class DetailScreenRouterTests: XCTestCase {
    // MARK: Subject under test
    var sut: DetailScreenRouterProtocol!
    var currentViewController: DetailScreenViewController!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupDetailScreenRouter()
    }
    
    override  func tearDown() {
        sut = nil
        currentViewController = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupDetailScreenRouter() {
        currentViewController = DetailScreenViewController()
        sut = DetailScreenRouter(view: currentViewController)
    }
    
    // MARK: - Tests
    func testRouteToDetailRecipe() {
        // Given
        // When
        sut.routeToUbication()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToUbication(), "routeToDetailRecipe executed")
    }
    
    func testRouteToBack() {
        // Given
        // When
        sut.routeToBack()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToBack(), "routeToBack executed")
    }
}
