//
//  PokedexView.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 11/30/24.
//

import SwiftUI

struct PokedexView: View {
    let pokemon: [PokemonSummary]
    
    @State private var searchText = ""
    
    var filteredPokemon: [PokemonSummary] {
        guard !searchText.isEmpty else { return pokemon }
        return pokemon.filter {$0.name.localizedCaseInsensitiveContains(searchText)}
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(filteredPokemon) { pokemon in
                        PokemonSummaryView(pokedexNumber: pokemon.id, pokemonName: pokemon.name, types: pokemon.types)
                            .padding(.horizontal, 10)
                    }
                }
            }
            .navigationTitle("Pokémon")
            .searchable(text: $searchText, placement: .automatic, prompt: "Search for a Pokémon")
        }
    }
}

#Preview {
    PokedexView(pokemon: [PokemonSummary(id: 1, name: "Bulbasaur", types: [.grass, .poison]), PokemonSummary(id: 2, name: "Ivysaur", types: [.grass, .poison]), PokemonSummary(id: 3, name: "Venusaur", types: [.grass, .poison])])
}
