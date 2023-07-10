//
//  HomeScreenInteractorTests.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp
import XCTest

class HomeScreenInteractorTests: XCTestCase {
    // MARK: Subject under test
    var sut: HomeScreenInteractor!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupHomeScreenInteractor()
    }
    
    override  func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupHomeScreenInteractor() {
        sut = HomeScreenInteractor()
    }
    
    // MARK: Tests
    func testGetListRecipes() {
        // Given
        // When
        sut.getListRecipes()
        //Then
        XCTAssertNoThrow(sut.getListRecipes(), "getListRecipes executed")
    }
}
