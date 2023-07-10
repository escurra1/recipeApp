//
//  DetailScreenConfigurator.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation

protocol DetailScreenConfiguratorProtocol: AnyObject {
    func configureDetailScreenView(viewController: DetailScreenViewController)
}

class DetailScreenConfigurator: DetailScreenConfiguratorProtocol {
    func configureDetailScreenView(viewController: DetailScreenViewController) {
        let router = DetailScreenRouter(view: viewController)
        let presenter = DetailScreenPresenter(andRouter: router)
        presenter.router = router
        viewController.presenter = presenter
    }
}
