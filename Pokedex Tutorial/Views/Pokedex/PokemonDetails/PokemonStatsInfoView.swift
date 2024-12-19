//
//  PokemonStatsInfoView.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 12/19/24.
//

import SwiftUI

struct PokemonStatsInfoView: View {
    let stats: [PokemonStat]
    let color: Color

    private let maxBaseStats = [255, 190, 250, 200, 194, 250]

    var body: some View {
        VStack {
            PokemonDetailsSectionView(text: "Base Stats")
            ForEach(stats) { pokemonStat in
                PokemonStatInfoView(name: pokemonStat.name, color: color, baseStat: pokemonStat.baseStat, max: maxBaseStats[pokemonStat.id - 1])
            }
        }
    }
}

struct PokemonStatInfoView: View {
    let name: String
    let color: Color
    let baseStat: Int
    let max: Int

    var body: some View {
        HStack {
            Text(name.uppercased())
                .font(.headline)
                .bold()
                .foregroundColor(color)
                .frame(width: 50, alignment: .leading)
            Text("\(baseStat)")
                .font(.headline)
                .foregroundColor(.secondary)
                .frame(width: 40, alignment: .leading)
            Rectangle()
                .frame(height: 13)
                .cornerRadius(6.5)
                .foregroundColor(Color(.secondarySystemFill))
                .overlay(
                    GeometryReader { geo in
                        Rectangle()
                            .cornerRadius(6.5)
                            .frame(width: geo.size.width * CGFloat(baseStat) / CGFloat(max))
                            .foregroundColor(color)
                    }
                )
        }
    }
}

#Preview {
    PokemonStatsInfoView(stats: [PokemonStat(id: 1, baseStat: 80), PokemonStat(id: 2, baseStat: 82), PokemonStat(id: 3, baseStat: 83), PokemonStat(id: 4, baseStat: 80), PokemonStat(id: 5, baseStat: 100), PokemonStat(id: 6, baseStat: 100)], color: .grass)
}
