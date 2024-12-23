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
                    PokemonAbilityView(ability: slot1Ability, color: color)

                    if let slot2Ability = slot2Ability {
                        PokemonAbilityView(ability: slot2Ability, color: color)
                    }
                }

                if let slot3Ability = slot3Ability {
                    PokemonAbilityView(ability: slot3Ability, color: color)
                }
            }
        }
    }
}

struct PokemonAbilityView: View {
    let ability: PokemonAbility
    let color: Color
    
    @State private var shouldPresentAbility = false
    
    var body: some View {
        HStack {
            Image(systemName: ability.isHidden ? "eye.slash" : "eye")
            Text(ability.name.capitalized)
                .frame(minWidth: 0, maxWidth: .infinity)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Image(systemName: "info.circle")
        }
        .padding(.horizontal)
        .padding(.vertical, 9)
        .background(ability.isHidden ? Color(.systemBackground) : color)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(color, lineWidth: 4))
        .cornerRadius(8)
        .onTapGesture {
            shouldPresentAbility = true
        }
        .sheet(isPresented: $shouldPresentAbility) {
            PokemonAbilityInfoView(ability: ability).presentationDetents([.medium])
        }
    }
}

struct PokemonAbilityInfoView: View {
    
    @EnvironmentObject var pokedexManager: PokedexManager
    
    let ability: PokemonAbility
    @State private var effectText: String?

    var body: some View {
        ScrollView {
            VStack {
                Text(ability.name.capitalized)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.bottom, 10)
                Rectangle()
                    .foregroundColor(Color(.systemFill))
                    .frame(height: 1)
                    .padding(.bottom, 10)
                if let effectText = effectText {
                    Text(effectText)
                        .padding(.horizontal)
                } else {
                    ProgressView()
                }
            }
            .onAppear() {
                Task.init {
                    let effectText = try await pokedexManager.fetchAbilityEffect(abilityId: ability.id)
                    self.effectText = effectText
                }
            }
        }
    }
}

#Preview {
    PokemonAbilitiesView(slot1Ability: PokemonAbility(id: 65, name: "Overgrow", isHidden: false), slot2Ability: nil, slot3Ability: PokemonAbility(id: 34, name: "Chlorophyll", isHidden: true), color: .grass).environmentObject(PokedexManager())
}

#Preview {
    PokemonAbilityInfoView(ability: PokemonAbility(id: 65, name: "Overgrow", isHidden: false)).environmentObject(PokedexManager())
}
