//
//  PokemonRow.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 11/30/24.
//

import SwiftUI

struct PokemonSummaryView: View {
    let pokedexNumber: Int
    let pokemonName: String
    let types: [PokemonType]
    
    private var pokedexNumberFormatted: String {
        return "#\(String(format: "%03d", pokedexNumber))"
    }
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(pokedexNumberFormatted)
                        .font(.title2)
                    Text(pokemonName.capitalized)
                        .font(.title2)
                        .bold()
                        .lineLimit(1)
                    Spacer()
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(hex: "D8D8D8"))
                    .padding(.bottom, 15)
                    .padding(.top, 10)
                HStack(spacing: 15) {
                    ForEach(types, id: \.hashValue) { type in
                        PokemonTypeView(type: type)
                    }
                }
            }
            
            Image("sprite/pokemon/\(pokedexNumber)")
                .resizable()
                .scaledToFill()
                .frame(width: 96, height: 96)
        }
        .padding(.leading)
        .padding(.vertical, 6)
        .background(types.first?.color() ?? Color.gray)
        .cornerRadius(4)
        .shadow(radius: 5)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PokemonSummaryView(pokedexNumber: 1, pokemonName: "Bulbasaur", types: [.grass, .poison])
}
