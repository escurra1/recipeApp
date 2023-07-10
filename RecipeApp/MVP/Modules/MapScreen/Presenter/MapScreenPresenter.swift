//
//  MapScreenPresenter.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation

protocol MapScreenPresenterProtocol: AnyObject {
    func goToBack()
}

class MapScreenPresenter: MapScreenPresenterProtocol {
    var router: MapScreenRouterProtocol?
    
    init(andRouter router: MapScreenRouterProtocol?) {
        self.router = router
    }
    
    func goToBack() {
        router?.routeToBack()
    }
}
