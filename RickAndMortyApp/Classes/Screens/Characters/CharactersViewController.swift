//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
import UIKit

internal final class CharactersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        
        tableViewCharacters.register(UINib(nibName: "CellCharacter", bundle: nil), forCellReuseIdentifier: "CellCharacter")
        presenter?.getCharacters()
        title = CallsConstants.characTitle
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getCharactersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellCharacter", for: indexPath) as? CustomCellCharacter else {
            return CustomCellCharacter()
        }

        cell.characterName.text = presenter?.charactersAtIndex(index: indexPath.row).name

        return cell
    }
}

extension CharactersViewController: CharactersViewProtocol {
    func loadCharacters() {
        DispatchQueue.main.async {
            self.tableViewCharacters.reloadData()
        }
    }
    
    
}
