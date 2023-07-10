//
//  MapScreenRouter.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation

protocol MapScreenRouterProtocol: AnyObject {
    var currentViewController: MapScreenViewController? { get set }
    func routeToBack()
}

class MapScreenRouter: MapScreenRouterProtocol {
    weak var currentViewController: MapScreenViewController?
    
    init(view viewController: MapScreenViewController) {
        self.currentViewController = viewController
    }
    
    func routeToBack() {
        guard let navigationController = currentViewController?.navigationController
        else {
            return
        }
        navigationController.popViewController(animated: true)
    }
}
