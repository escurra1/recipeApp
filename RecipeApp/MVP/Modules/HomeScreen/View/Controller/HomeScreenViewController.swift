//
//  HomeScreenViewController.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import UIKit
import AlamofireImage

// MARK: - HomeScreenViewProtocol
protocol HomeScreenViewProtocol: AnyObject {
    func showListRecipe(recipe: [RecipeResponse])
    func showProgressView()
    func hideProgressView()
}

class HomeScreenViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var recipeSearchBar: UISearchBar?
    @IBOutlet var listRecipeTableView: UITableView?
    
    // MARK: - Properties
    var presenter: HomeScreenPresenterProtocol?
    var homeScreenConfigurator: HomeScreenConfiguratorProtocol?
    var listRecipeSelect: RecipeResponse?
    var arrayFilterListRecipe: [RecipeResponse]? = []
    var listRecipe: [RecipeResponse]? = []
    var refresh: UIRefreshControl!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchBar()
        setupRefreshService()
        configureHomeScreen()
        presenter?.getListRecipes()
    }
    
    //MARK: - Functions
    private func configureHomeScreen() {
        homeScreenConfigurator = HomeScreenConfigurator()
        homeScreenConfigurator?.configureListRecipeView(viewController: self)
    }
    
    private func setupTableView() {
        listRecipeTableView?.delegate = self
        listRecipeTableView?.dataSource = self
        listRecipeTableView?.register(UINib(nibName: HomeScreenTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: HomeScreenTableViewCell.nibName)
        listRecipeTableView?.separatorStyle = .none
    }
    
    private func setupRefreshService() {
        self.refresh = UIRefreshControl()
        self.listRecipeTableView?.alwaysBounceVertical = true
        self.refresh?.tintColor = UIColor.gray
        self.refresh?.backgroundColor = UIColor.white
        self.refresh?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        self.refresh?.attributedTitle = NSAttributedString(string: NSLocalizedString("refreshData", comment: "refreshData"), attributes: attributes)
        self.listRecipeTableView?.addSubview(refresh)
    }
    
    @objc func refreshData() {
        DispatchQueue.main.async {
            self.listRecipeTableView?.reloadData()
        }
        stopRefreshData()
    }
    
    private func stopRefreshData() {
        self.refresh?.endRefreshing()
    }
    
    private func setupSearchBar() {
        recipeSearchBar?.delegate = self
        recipeSearchBar?.placeholder = NSLocalizedString("searchRecipe", comment: "searchRecipe")
        recipeSearchBar?.showsCancelButton = false
        recipeSearchBar?.autocorrectionType = .no
        recipeSearchBar?.spellCheckingType = .no
    }
    
    fileprivate func showAllListRecipe(recipe: [RecipeResponse]) {
        arrayFilterListRecipe = recipe
        listRecipeTableView?.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.recipeSearchBar?.showsCancelButton = false
        self.view.endEditing(true)
    }
}

// MARK: - UITableViewDelegate - UITableViewDataSource
extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rowListUser = arrayFilterListRecipe {
            return rowListUser.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listRecipeTableView?.dequeueReusableCell(withIdentifier: HomeScreenTableViewCell.nibName, for: indexPath) as? HomeScreenTableViewCell else {
            return UITableViewCell()
        }
        let item = arrayFilterListRecipe?[indexPath.row]
        cell.configureView(viewRecipe: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        listRecipeSelect = arrayFilterListRecipe?[indexPath.row]
        presenter?.goToDetailRecipe()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeScreenTableViewCell.sizeListRecipe
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset < -95 {
            self.refresh.attributedTitle = NSAttributedString(string: NSLocalizedString("successData", comment: "successData"), attributes: [NSAttributedString.Key.foregroundColor: refresh.tintColor!])
        } else {
            self.refresh.attributedTitle = NSAttributedString(string: NSLocalizedString("refreshData", comment: "refreshData"), attributes: [NSAttributedString.Key.foregroundColor: refresh.tintColor!])
        }
        self.refresh?.backgroundColor = UIColor.white
    }
}

// MARK: - UISearchBarDelegate
extension HomeScreenViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        arrayFilterListRecipe = listRecipe
        if searchText.isEmpty == false {
            arrayFilterListRecipe = listRecipe?.filter({
                $0.recipeName.contains(searchText)})
        }
        if self.arrayFilterListRecipe?.count == 0 {
            searchBar.showsCancelButton = true
            let alert = UIAlertController(title: NSLocalizedString("listIsEmpty", comment: "listIsEmpty"), message: NSLocalizedString("messageAlert", comment: "messageAlert"), preferredStyle: .alert)
            let okAction = UIAlertAction(title: NSLocalizedString("accept", comment: "accept"), style: .default) { (_) in
                self.recipeSearchBar?.text = .empty
                self.recipeSearchBar?.showsCancelButton = false
                self.recipeSearchBar?.endEditing(true)
                guard let recipe = self.listRecipe else {
                    return
                }
                self.showAllListRecipe(recipe: recipe)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            listRecipeTableView?.reloadData()
        }
        listRecipeTableView?.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.isFirstResponder == true  {
            searchBar.showsCancelButton = true
            searchBar.endEditing(true)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = .empty
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
        guard let recipe = self.listRecipe else {
            return
        }
        showAllListRecipe(recipe: recipe)
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return filterSearch(searchBar, filterText: text, range: range)
    }
}

// MARK: - HomeScreenViewProtocol
extension HomeScreenViewController: HomeScreenViewProtocol {
    func showListRecipe(recipe: [RecipeResponse]) {
        arrayFilterListRecipe = recipe
        listRecipe?.insert(contentsOf: recipe, at: 0)
        listRecipeTableView?.reloadData()
    }
    
    func showProgressView() {
        let progress = MBProgressHUD.showAdded(to: self.view, animated: true)
        progress.label.text = NSLocalizedString("loadData", comment: "loadData")
        progress.detailsLabel.text = NSLocalizedString("pleaseWait", comment: "pleaseWait")
        progress.isUserInteractionEnabled = false
    }
    
    func hideProgressView() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
