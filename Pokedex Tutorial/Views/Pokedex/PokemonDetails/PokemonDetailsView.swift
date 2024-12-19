//
//  PokemonDetailsView.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 12/14/24.
//

import SwiftUI

struct PokemonDetailsView: View {
    @EnvironmentObject var pokedexManager: PokedexManager
    
    let pokemonSummary: PokemonSummary
    
    @State private var pokemon: Pokemon?
    
    init(pokemonSummary: PokemonSummary, pokemon: Pokemon?) {
        self.pokemonSummary = pokemonSummary
        self._pokemon = State(initialValue: pokemon)
    }
    
    var body: some View {
        VStack(spacing: 5) {
            PokemonSummaryView(pokedexNumber: pokemonSummary.id, pokemonName: pokemonSummary.name, types: pokemonSummary.types)
            
            if let pokemon = pokemon {
                ScrollView {
                    VStack {
                        SpeciesInfoView(id: pokemon.id, height: pokemon.height, weight: pokemon.weight, bodyShapeId: pokemon.bodyShapeId, genus: pokemon.genus, color: pokemonSummary.types.first!.color(), playCry: nil)
                    }
                }
            } else {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
    }
}

struct PokemonDetailsSectionView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
    }
}

#Preview("Loading") {
    PokemonDetailsView(pokemonSummary: PokemonSummary(id: 3, name: "Venusaur", types: [.grass, .poison]), pokemon: nil)
}

#Preview("Loading Done") {
    PokemonDetailsView(pokemonSummary: PokemonSummary(id: 3, name: "Venusaur", types: [.grass, .poison]), pokemon: Pokemon(id: 3, name: "Venusaur", types: [.grass, .poison], height: 20, weight: 1000, bodyShapeId: 2, genus: "Seed"))
}
