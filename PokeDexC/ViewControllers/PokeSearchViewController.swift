//
//  PokeSearchViewController.swift
//  PokeDexC
//
//  Created by DevMountain on 9/11/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import UIKit

class PokeSearchViewController: UIViewController {
    
    
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var pokemon: TRAPokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokeSearchBar.delegate = self
        
        TRAPokemonController.fetchPokemon(forSearchTerm: "Dewgong") { (pokemon) in
            self.pokemon = pokemon
            
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    func updateViews(){
        guard let pokemon = pokemon else { return }
        
        nameLabel.text = pokemon.name
        idLabel.text = "ID: \(pokemon.identifier)"
        abilitiesLabel.text = "Abilities: " + (pokemon.abilities.joined(separator: ", "))
    }

}

extension PokeSearchViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        TRAPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            self.pokemon = pokemon
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
}
