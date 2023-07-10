//
//  DetailScreenRouter.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation

protocol DetailScreenRouterProtocol: AnyObject {
    var currentViewController: DetailScreenViewController? { get set }
    func routeToBack()
    func routeToUbication()
}

class DetailScreenRouter: DetailScreenRouterProtocol {
    weak var currentViewController: DetailScreenViewController?
    let storyBoardRecipes = UIStoryboard(name: Constants.Storyboards.recipesStoryboard, bundle: nil)
    
    init(view viewController: DetailScreenViewController) {
        self.currentViewController = viewController
    }
    
    func routeToBack() {
        guard let navigationController = currentViewController?.navigationController
        else {
            return
        }
        navigationController.popViewController(animated: true)
    }
    
    func routeToUbication() {
        guard let navigationController = currentViewController?.navigationController, let viewController = storyBoardRecipes.instantiateViewController(withIdentifier: Constants.ViewControllers.mapScreenViewController) as? MapScreenViewController
        else {
            return
        }
        viewController.recipeService = currentViewController?.listRecipeDetail
        navigationController.pushViewController(viewController, animated: true)
    }
}
