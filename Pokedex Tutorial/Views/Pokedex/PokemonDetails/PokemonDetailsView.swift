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
    
    init(pokemonSummary: PokemonSummary) {
        self.pokemonSummary = pokemonSummary
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

#Preview {
    PokemonDetailsView(pokemonSummary: PokemonSummary(id: 3, name: "Venusaur", types: [.grass, .poison]))
}

#Preview {
    PokemonDetailsSectionView(text: "Species Info")
}
