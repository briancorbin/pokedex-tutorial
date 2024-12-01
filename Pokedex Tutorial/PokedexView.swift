//
//  PokedexView.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 11/30/24.
//

import SwiftUI

struct PokedexView: View {
    let pokemon: [Pokemon]
    
    var body: some View {
        List(pokemon) { pokemon in
            PokemonSummaryView(pokedexNumber: pokemon.id, pokemonName: pokemon.name, types: pokemon.types)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    PokedexView(pokemon: [Pokemon(id: 1, name: "Bulbasaur", types: [.grass, .poison]), Pokemon(id: 2, name: "Ivysaur", types: [.grass, .poison]), Pokemon(id: 3, name: "Venusaur", types: [.grass, .poison])])
}
