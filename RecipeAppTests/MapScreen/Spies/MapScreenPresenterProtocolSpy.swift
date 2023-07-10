//
//  MapScreenPresenterProtocolSpy.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp

class MapScreenPresenterProtocolSpy: MapScreenPresenterProtocol {
    // MARK: - Properties
    var didGoToBack = false
    
    // MARK: - Functions
    func goToBack() {
        self.didGoToBack = true
    }
}
