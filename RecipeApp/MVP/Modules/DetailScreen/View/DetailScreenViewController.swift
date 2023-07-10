//
//  DetailScreenViewController.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import UIKit
import AlamofireImage

class DetailScreenViewController: UIViewController {
    // MARK: - IBOutles
    @IBOutlet weak var iconDetailImageView: UIImageView?
    @IBOutlet weak var ratingDetailLabel: UILabel?
    @IBOutlet weak var countryDetailLabel: UILabel?
    @IBOutlet weak var nameDetailLabel: UILabel?
    @IBOutlet weak var descriptionDetailLabel: UITextView?
    @IBOutlet weak var mapDetailView: UIView?
    @IBOutlet weak var recipeTitleLabel: UILabel?
    
    // MARK: - Properties
    var presenter: DetailScreenPresenterProtocol?
    var detailScreenConfigurator: DetailScreenConfiguratorProtocol?
    var listRecipeDetail: RecipeResponse?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetailScreen()
        setupView()
    }
    
    //MARK: - Functions
    private func configureDetailScreen() {
        detailScreenConfigurator = DetailScreenConfigurator()
        detailScreenConfigurator?.configureDetailScreenView(viewController: self)
    }
    
    private func setupView() {
        guard let recipe = listRecipeDetail else {
            return
        }
        let rating: Int = recipe.rating
        let value = String(describing: rating)
        ratingDetailLabel?.text = "\(NSLocalizedString("rating", comment: "rating"))" + "\(value)" + "  ⭐️"
        countryDetailLabel?.text = "\(NSLocalizedString("country", comment: "country"))" + "\(recipe.countryOrigin)" + "  🌎"
        recipeTitleLabel?.text = recipe.recipeName
        descriptionDetailLabel?.text = "Descripción:  \n\n" + recipe.description
        nameDetailLabel?.text = "\(NSLocalizedString("preparation", comment: "preparation"))"
        let border = UIColor(named: "borderBlue")
        mapDetailView?.layer.borderColor = border?.cgColor
        mapDetailView?.layer.borderWidth = 2.0
        mapDetailView?.layer.cornerRadius = 20
        mapDetailView?.backgroundColor = .clear
        let urlPhotoRecipe = recipe.urlPhoto
        let url = urlPhotoRecipe
        if let url = URL(string: url) {
            iconDetailImageView?.af.setImage(withURL: url, placeholderImage:  UIImage(named: "place-recipe"))
        }
        iconDetailImageView?.layer.cornerRadius = 10
        iconDetailImageView?.layer.borderWidth = 0
    }
    
    // MARK: - IBActions
    @IBAction func didTapUbication(_ sender: UIButton) {
        presenter?.goToUbication()
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        presenter?.goToBack()
    }
}
