//
//  Constants.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation

struct Constants {
    struct Urls {
        static let baseUrl = "https://demo7409515.mockable.io/"
        static let getRecipes = "getRecipes"
    }
    
    struct ViewControllers {
        static let homeScreenViewController = "HomeScreenViewController"
        static let detailScreenViewController = "DetailScreenViewController"
        static let mapScreenViewController = "MapScreenViewController"
    }
    
    struct Error {
        static let errorGeneric = "ErrorGeneric"
    }
    
    struct Cells {
        static let homeScreenCell = "HomeScreenTableViewCell"
        static let rowHeightListRecipeCell = 180
    }
    
    struct Storyboards {
        static let recipesStoryboard = "Recipes"
    }
    
    struct Pattern {
        static let characterAllow = "^[A-Za-zÑ-ñ-á-é-í-ó-ú ]+$"
        static let charactersNotAllowed = """
                [$&+€~£¥•¢{}≠´∞,¬÷:;=¿?@.-;#0123456789|'/_<>^*()-%¡!]""
                """
    }
}
