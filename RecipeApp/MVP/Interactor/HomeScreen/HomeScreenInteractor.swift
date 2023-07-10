//
//  HomeScreenInteractor.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation
import Alamofire

protocol HomeScreenInteractorProtocol: AnyObject {
    func getListRecipes()
    var presenter: HomeScreenPresenterProtocol? { get set }
}

class HomeScreenInteractor: HomeScreenInteractorProtocol {
    weak var presenter: HomeScreenPresenterProtocol?
    
    func getListRecipes() {
        guard let url = URL(string: Constants.Urls.baseUrl + Constants.Urls.getRecipes) else {
            return
        }
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default, headers: nil)
        let decodableResponse = [RecipeResponse].self
        request.responseDecodable(of: decodableResponse) { response in
            switch response.result {
            case .success(let response):
                self.presenter?.didShowListRecipe(listRecipe: response)
            case .failure(let error):
                self.presenter?.goToErrorGeneric()
                debugPrint("\(error.localizedDescription)")
            }
        }
    }
}
