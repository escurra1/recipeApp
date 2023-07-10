//
//  MapScreenViewController.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import UIKit
import MapKit

class MapScreenViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var ubicationTitleLabel: UILabel?
    @IBOutlet weak var ubicationMapKit: MKMapView?
    @IBOutlet weak var deliveryButton: UIButton?
    
    // MARK: - Properties
    var presenter: MapScreenPresenterProtocol?
    var mapScreenConfigurator: MapScreenConfiguratorProtocol?
    var recipeService: RecipeResponse?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapScreen()
        setupView()
    }
    
    // MARK: - Functions
    private func configureMapScreen() {
        mapScreenConfigurator = MapScreenConfigurator()
        mapScreenConfigurator?.configureMapScreenView(viewController: self)
    }
    
    private func setupView() {
        showAlertUbication()
        guard let recipe = recipeService else { return }
        ubicationTitleLabel?.text = "\(NSLocalizedString("ubication", comment: "ubication"))"
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: recipe.latitude, longitude: recipe.longitude)
        annotation.title = recipe.address
        ubicationMapKit?.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        ubicationMapKit?.setRegion(region, animated: true)
    }
    
    private func showAlertUbication(){
        guard let recipe = recipeService else { return }
        let alert = UIAlertController(title: recipe.recipeName, message: recipe.address, preferredStyle: .alert)
        let okAction = UIAlertAction(title: (NSLocalizedString("accept", comment: "accept")), style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - IBAction
    @IBAction func didTapBack(_ sender: UIButton) {
        presenter?.goToBack()
    }
}
