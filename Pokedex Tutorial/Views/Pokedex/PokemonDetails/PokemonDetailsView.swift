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
        VStack {
            PokemonSummaryView(pokedexNumber: pokemonSummary.id, pokemonName: pokemonSummary.name, types: pokemonSummary.types)
            
            if let pokemon = pokemon {
                ScrollView {
                    VStack(spacing: 20) {
                        PokemonSpeciesInfoView(id: pokemon.id, height: pokemon.height, weight: pokemon.weight, bodyShapeId: pokemon.bodyShapeId, genus: pokemon.genus, color: pokemonSummary.color, playCry: nil)
                        PokemonAbilitiesView(slot1Ability: pokemon.slot1Ability, slot2Ability: pokemon.slot2Ability, slot3Ability: pokemon.slot3Ability, color: pokemonSummary.color)
                        PokemonStatsInfoView(stats: pokemon.stats, color: pokemonSummary.color)
                    }
                    .padding()
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
    PokemonDetailsView(pokemonSummary: PokemonSummary(id: 3, name: "Venusaur", types: [.grass, .poison]), pokemon: Pokemon(id: 3, name: "Venusaur", types: [.grass, .poison], height: 20, weight: 1000, bodyShapeId: 2, genus: "Seed", stats: [PokemonStat(id: 1, baseStat: 80), PokemonStat(id: 2, baseStat: 82), PokemonStat(id: 3, baseStat: 83), PokemonStat(id: 4, baseStat: 80), PokemonStat(id: 5, baseStat: 100), PokemonStat(id: 6, baseStat: 100)], slot1Ability: PokemonAbility(name: "Overgrow", isHidden: false), slot2Ability: nil, slot3Ability: PokemonAbility(name: "Chlorophyll", isHidden: true)))
}
