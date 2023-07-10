//
//  HomeScreenPresenterTests.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp
import XCTest

class HomeScreenPresenterTests: XCTestCase {
    // MARK: Subject under test
    var sut: HomeScreenPresenter!
    var spyView: HomeScreenViewProtocolSpy!
    var spyInteractor: HomeScreenInteractorProtocolSpy!
    var spyRouter: HomeScreenRouterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupHomeScreenPresenter()
    }
    
    override  func tearDown() {
        spyInteractor = nil
        spyView = nil
        spyRouter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupHomeScreenPresenter() {
        spyInteractor = HomeScreenInteractorProtocolSpy()
        spyView = HomeScreenViewProtocolSpy()
        spyRouter = HomeScreenRouterProtocolSpy()
        sut = HomeScreenPresenter(withViewController: spyView, andRouter: spyRouter, useCase: spyInteractor)
        sut.interactor = spyInteractor
        sut.router = spyRouter
        sut.view = spyView
    }
    
    // MARK: - Tests
    func testGetListRecipes() {
        // Given
        // When
        sut.getListRecipes()
        //Then
        XCTAssertNoThrow(sut.getListRecipes(), "getListRecipes executed")
        XCTAssertTrue(spyView.didShowProgressView, "didShowProgressView executed")
        XCTAssertNoThrow(spyInteractor.getListRecipes())
    }
    
    func testDidShowListRecipe() {
        // Given
        let listRecipe: [RecipeResponse] = [RecipeResponse]()
        // When
        sut.didShowListRecipe(listRecipe: listRecipe)
        // Then
        XCTAssertNoThrow(sut.didShowListRecipe(listRecipe: listRecipe), "didShowListRecipe executed")
        XCTAssertTrue(spyView.didHideProgressView, "didHideProgressView executed")
        XCTAssertTrue(spyView.didShowListRecipe, "didShowListRecipe executed")
    }
    
    func testGoToDetailRecipe() {
        // Given
        // When
        sut.goToDetailRecipe()
        // Then
        XCTAssertNoThrow(sut.goToDetailRecipe(), "goToDetailRecipe executed")
        XCTAssertTrue(spyRouter.didRouteToDetailRecipe, "didRouteToDetailRecipe executed")
    }
    
    func testGoToErrorGeneric() {
        // Given
        // When
        sut.goToErrorGeneric()
        // Then
        XCTAssertNoThrow(sut.goToErrorGeneric(), "goToErrorGeneric executed")
        XCTAssertTrue(spyRouter.didRouteToErrorGeneric, "didRouteToErrorGeneric executed")
    }
}
