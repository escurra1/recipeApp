//
//  HomeScreenViewProtocolSpy.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp

class HomeScreenViewProtocolSpy: HomeScreenViewProtocol {
    // MARK: - Properties
    var didShowListRecipe = false
    var didShowProgressView = false
    var didHideProgressView = false
    var recipe = [RecipeResponse]()
    
    // MARK: - Functions
    func showListRecipe(recipe: [RecipeResponse]) {
        self.didShowListRecipe = true
        self.recipe = recipe
    }
    
    func showProgressView() {
        self.didShowProgressView = true
    }
    
    func hideProgressView() {
        self.didHideProgressView = true
    }
}
