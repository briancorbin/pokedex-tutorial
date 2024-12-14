//
//  Pokemon.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 11/30/24.
//

import SwiftUI
import PokeApi

struct PokemonSummary: Identifiable {
    let id: Int
    let name: String
    let types: [PokemonType]
    
    init(id: Int, name: String, types: [PokemonType]) {
        self.id = id
        self.name = name
        self.types = types
    }
    
    init(pokemonDexNumber: PokedexPokemonQuery.Data.Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber) {
        self.id = pokemonDexNumber.pokedex_number
        self.name = pokemonDexNumber.pokemon_v2_pokemonspecy!.name
        self.types = pokemonDexNumber.pokemon_v2_pokemonspecy!.pokemon_v2_pokemons.first!.pokemon_v2_pokemontypes.map({ PokemonType(rawValue: $0.pokemon_v2_type!.id)! })
    }
}
