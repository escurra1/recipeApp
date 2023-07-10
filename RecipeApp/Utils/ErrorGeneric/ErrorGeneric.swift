//
//  ErrorGeneric.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import UIKit

class ErrorGeneric: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var descriptionErrorLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionErrorLabel.text = (NSLocalizedString("errorGeneric", comment: "errorGeneric"))
    }
}
