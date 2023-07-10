//
//  RecipeResponse.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation

// MARK: - RecipeResponse
struct RecipeResponse: Decodable {
    let recipeName: String
    let description: String
    let urlPhoto: String
    let countryOrigin: String
    let address: String
    let rating: Int
    let latitude: Double
    let longitude: Double
    let preparationTime: String
    let ingredients: [String]
}
