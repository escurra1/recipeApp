//
//  DetailScreenRouterProtocolSpy.swift
//  RecipeAppTests
//
//  Created by Escurra Colquis on 07/07/23.
//

@testable import RecipeApp

class DetailScreenRouterProtocolSpy: DetailScreenRouterProtocol {
    // MARK: - Properties
    var didRouteToBack = false
    var didRouteToUbication = false
    var currentViewController: DetailScreenViewController?
    
    // MARK: - Functions
    func routeToBack() {
        self.didRouteToBack = true
    }
    
    func routeToUbication() {
        self.didRouteToUbication = true
    }
}
