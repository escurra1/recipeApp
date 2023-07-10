//
//  HomeScreenPresenterProtocolSpy.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp

class HomeScreenPresenterProtocolSpy: HomeScreenPresenterProtocol {
    // MARK: - Properties
    var didShowListRecipe = false
    var didGetListRecipes = false
    var didGoToDetailRecipe = false
    var didGoToErrorGeneric = false
    var listRecipe = [RecipeResponse]()
    
    // MARK: - Functions
    func didShowListRecipe(listRecipe: [RecipeResponse]) {
        self.didShowListRecipe = true
        self.listRecipe = listRecipe
    }
    
    func getListRecipes() {
        self.didGetListRecipes = true
    }
    
    func goToDetailRecipe() {
        self.didGoToDetailRecipe = true
    }
    
    func goToErrorGeneric() {
        self.didGoToErrorGeneric = true
    }
}
