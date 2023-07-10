//
//  HomeScreenRouter.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation

protocol HomeScreenRouterProtocol: AnyObject {
    var currentViewController: HomeScreenViewController? { get set }
    func routeToDetailRecipe()
    func routeToErrorGeneric()
}

class HomeScreenRouter: HomeScreenRouterProtocol {
    weak var currentViewController: HomeScreenViewController?
    let storyBoardRecipes = UIStoryboard(name: Constants.Storyboards.recipesStoryboard, bundle: nil)
    
    init(view viewController: HomeScreenViewController) {
        self.currentViewController = viewController
    }
    
    func routeToDetailRecipe() {
        guard let navigationController = currentViewController?.navigationController, let viewController = storyBoardRecipes.instantiateViewController(withIdentifier: Constants.ViewControllers.detailScreenViewController) as? DetailScreenViewController
        else {
            return
        }
        viewController.listRecipeDetail = currentViewController?.listRecipeSelect
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeToErrorGeneric() {
        guard let navigationController = currentViewController?.navigationController, let viewController = storyBoardRecipes.instantiateViewController(withIdentifier: Constants.Error.errorGeneric) as? ErrorGeneric
        else {
            return
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
