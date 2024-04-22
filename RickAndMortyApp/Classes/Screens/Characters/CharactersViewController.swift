//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
import UIKit

internal final class CharactersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchCharacterBar: UISearchBar!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableViewCharacters: UITableView!
    
    var presenter: CharactersPresenterProtocol?
    var delegate: CharactersCoordinatorDelegate?
    
    public convenience init(presenter: CharactersPresenterProtocol) {
        self.init(nibName: "CharactersViewController", bundle: nil)
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCharacters.dataSource = self
        tableViewCharacters.delegate = self
        searchCharacterBar.delegate = self
        
        tableViewCharacters.register(UINib(nibName: "CellCharacter", bundle: nil), forCellReuseIdentifier: "CellCharacter")
        presenter?.viewDidLoadWasCalled()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getCharactersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let callApiAgain = presenter?.getCharactersCount() else { return }
        if presenter?.checkNextCall() == true {
            if indexPath.row == (callApiAgain - 5) {
                presenter?.getCharacters()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellCharacter", for: indexPath) as? CustomCellCharacter else {
            return CustomCellCharacter()
        }

        guard let characterAtIndex = presenter?.charactersAtIndex(index: indexPath.row) else { return cell }

        cell.characterName.text = characterAtIndex.name

        presenter?.downloadCharacterImage(characterAtIndex, cell)

        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchCharacter(with: searchText)
    }

}

extension CharactersViewController: CharactersViewProtocol {
    
    func loadCharacters() {
        DispatchQueue.main.async {
            self.tableViewCharacters.reloadData()
        }
    }
    
    func loadingView(_ state: LoadingState) {
        switch state {
        case .show:
            showLoading()
        case .hide:
            hideLoading()
        }
    }

    private func showLoading() {
        DispatchQueue.main.async {
            self.loadingIndicator.isHidden = false
            self.loadingIndicator.startAnimating()
        }
    }

    private func hideLoading() {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
        }
    }

    func showError(title: String, message: String) {
        DispatchQueue.main.async {
            ShowAlert().showAlertView(title: title,
                                      message: message,
                                      button1Text: "OK",
                                      parent: self)
        }
    }
    
    
}
