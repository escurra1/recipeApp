//
//  HomeScreenPresenter.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation

protocol HomeScreenPresenterProtocol: AnyObject {
    func didShowListRecipe(listRecipe: [RecipeResponse])
    func getListRecipes()
    func goToDetailRecipe()
    func goToErrorGeneric()
}

class HomeScreenPresenter: HomeScreenPresenterProtocol {
    weak var view: HomeScreenViewProtocol?
    var router: HomeScreenRouterProtocol?
    var interactor: HomeScreenInteractorProtocol?
    
    init(withViewController view: HomeScreenViewProtocol?, andRouter router: HomeScreenRouterProtocol?, useCase interactor: HomeScreenInteractorProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func goToErrorGeneric() {
        view?.hideProgressView()
        router?.routeToErrorGeneric()
    }
    
    func getListRecipes() {
        guard Utils.checkInternetConnection() else {
            goToErrorGeneric()
            return
        }
        view?.showProgressView()
        interactor?.getListRecipes()
    }
    
    func didShowListRecipe(listRecipe: [RecipeResponse]) {
        view?.hideProgressView()
        view?.showListRecipe(recipe: listRecipe)
    }
    
    func goToDetailRecipe() {
        guard Utils.checkInternetConnection() else {
            Utils.showMessageTop(true, textBody: NSLocalizedString("verificatedInternet", comment: "verificatedInternet"))
            return
        }
        router?.routeToDetailRecipe()
    }
}
