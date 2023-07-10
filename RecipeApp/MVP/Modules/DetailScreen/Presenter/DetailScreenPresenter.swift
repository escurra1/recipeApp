//
//  DetailScreenPresenter.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation

protocol DetailScreenPresenterProtocol: AnyObject {
    func goToUbication()
    func goToBack()
}

class DetailScreenPresenter: DetailScreenPresenterProtocol {
    var router: DetailScreenRouterProtocol?
    
    init(andRouter router: DetailScreenRouterProtocol?) {
        self.router = router
    }
    
    func goToBack() {
        router?.routeToBack()
    }
    
    func goToUbication() {
        guard Utils.checkInternetConnection() else {
            Utils.showMessageTop(true, textBody: NSLocalizedString("verificatedInternet", comment: "verificatedInternet"))
            return
        }
        router?.routeToUbication()
    }
}
