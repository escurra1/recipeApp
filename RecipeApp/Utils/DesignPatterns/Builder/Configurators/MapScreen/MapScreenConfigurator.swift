//
//  MapScreenConfigurator.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//


import Foundation

protocol MapScreenConfiguratorProtocol: AnyObject {
    func configureMapScreenView(viewController: MapScreenViewController)
}

class MapScreenConfigurator: MapScreenConfiguratorProtocol {
    func configureMapScreenView(viewController: MapScreenViewController) {
        let router = MapScreenRouter(view: viewController)
        let presenter = MapScreenPresenter(andRouter: router)
        presenter.router = router
        viewController.presenter = presenter
    }
}
