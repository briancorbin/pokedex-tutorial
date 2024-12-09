//
//  PokedexManager.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 12/2/24.
//

import SwiftUI

class PokedexManager: ObservableObject {
    @Published var pokemon: [Pokemon] = []
    
    init() {
        loadPokemon()
    }
    
    private func loadPokemon() {
        let url = Bundle.main.url(forResource: "pokemon", withExtension: "json")
        let jsonData = try! Data(contentsOf: url!)
        let response = try! JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
        let data = response["data"] as! [String: Any]
        let pokemonV2Pokedex = data["pokemon_v2_pokedex"] as! [Any]
        let pokedex = pokemonV2Pokedex.first! as! [String: Any]

        let pokemonDexNumbers = pokedex["pokemon_v2_pokemondexnumbers"] as! [Any]

        self.pokemon = pokemonDexNumbers.map { pokemonDexNumber in
            let pokedexNumber = (pokemonDexNumber as! [String: Any])["pokedex_number"] as! Int
            let pokemonSpecy = (pokemonDexNumber as! [String: Any])["pokemon_v2_pokemonspecy"] as! [String: Any]
            let pokemonName = pokemonSpecy["name"] as! String
            let pokemonInfo = pokemonSpecy["pokemon_v2_pokemons"] as! [Any]
            let pokemonInfoFirst = pokemonInfo.first! as! [String: Any]
            let pokemonTypes = pokemonInfoFirst["pokemon_v2_pokemontypes"] as! [Any]
            let types = pokemonTypes.map { pokemonType in
                let pokemonTypeFlattened = (pokemonType as! [String: Any])["pokemon_v2_type"] as! [String: Int]
                let type = PokemonType(rawValue: pokemonTypeFlattened["id"]!)!
                return type
            }
            
            let newPokemon = Pokemon(id: pokedexNumber, name: pokemonName, types: types)
            return newPokemon
        }
    }
}
