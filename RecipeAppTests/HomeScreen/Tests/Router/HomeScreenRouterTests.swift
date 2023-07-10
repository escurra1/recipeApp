//
//  HomeScreenRouterTests.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp
import XCTest

class HomeScreenRouterTests: XCTestCase {
    // MARK: Subject under test
    var sut: HomeScreenRouterProtocol!
    var currentViewController: HomeScreenViewController!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupHomeScreenRouter()
    }
    
    override  func tearDown() {
        sut = nil
        currentViewController = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupHomeScreenRouter() {
        currentViewController = HomeScreenViewController()
        sut = HomeScreenRouter(view: currentViewController)
    }
    
    // MARK: - Tests
    func testRouteToDetailRecipe() {
        // Given
        // When
        sut.routeToDetailRecipe()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToDetailRecipe(), "routeToDetailRecipe executed")
    }
    
    func testRouteToErrorGeneric() {
        // Given
        // When
        sut.routeToErrorGeneric()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToErrorGeneric(), "routeToErrorGeneric executed")
    }
}
