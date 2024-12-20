//
//  PokemonAbilitiesView.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 12/20/24.
//

import SwiftUI


struct PokemonAbilitiesView: View {
    let slot1Ability: PokemonAbility
    let slot2Ability: PokemonAbility?
    let slot3Ability: PokemonAbility?
    let color: Color
    
    var body: some View {
        VStack {
            PokemonDetailsSectionView(text: "Abilities")
            VStack {
                HStack {
                    PokemonAbilityInfoView(name: slot1Ability.name, isHidden: slot1Ability.isHidden, color: color)

                    if let slot2Ability = slot2Ability {
                        PokemonAbilityInfoView(name: slot2Ability.name, isHidden: slot2Ability.isHidden, color: color)
                    }
                }

                if let slot3Ability = slot3Ability {
                    PokemonAbilityInfoView(name: slot3Ability.name, isHidden: slot3Ability.isHidden, color: color)
                }
            }
        }
    }
}

struct PokemonAbilityInfoView: View {
    
    let name: String
    let isHidden: Bool
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: isHidden ? "eye.slash" : "eye")
            Text(name)
                .frame(minWidth: 0, maxWidth: .infinity)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Image(systemName: "info.circle")
        }
        .padding(.horizontal)
        .padding(.vertical, 9)
        .background(isHidden ? Color(.systemBackground) : color)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(color, lineWidth: 4))
        .cornerRadius(8)
    }
}

#Preview {
    PokemonAbilitiesView(slot1Ability: PokemonAbility(name: "Overgrow", isHidden: false), slot2Ability: nil, slot3Ability: PokemonAbility(name: "Chlorophyll", isHidden: true), color: .grass)
}
