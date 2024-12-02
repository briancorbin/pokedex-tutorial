//
//  PokemonType.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 11/30/24.
//

import SwiftUI

enum PokemonType: Int {
    case normal = 1, fighting, flying, poison, ground, rock, bug, ghost, steel, fire,
         water, grass, electric, psychic, ice, dragon, dark, fairy
}

extension PokemonType {
    func color() -> Color {
        switch self {
        case .poison: return .poison
        case .grass: return .grass
        case .normal: return .normal
        case .fighting: return .fighting
        case .flying: return .flying
        case .ground: return .ground
        case .rock: return .rock
        case .bug: return .bug
        case .ghost: return .ghost
        case .steel: return .steel
        case .fire: return .fire
        case .water: return .water
        case .electric: return .electric
        case .psychic: return .psychic
        case .ice: return .ice
        case .dragon: return .dragon
        case .dark: return .dark
        case .fairy: return .fairy
        }
    }
    
    func text() -> String {
        switch self {
        case .poison: return "Poison"
        case .grass: return "Grass"
        case .normal: return "Normal"
        case .fighting: return "Fighting"
        case .flying: return "Flying"
        case .ground: return "Ground"
        case .rock: return "Rock"
        case .bug: return "Bug"
        case .ghost: return "Ghost"
        case .steel: return "Steel"
        case .fire: return "Fire"
        case .water: return "Water"
        case .electric: return "Electric"
        case .psychic: return "Psychic"
        case .ice: return "Ice"
        case .dragon: return "Dragon"
        case .dark: return "Dark"
        case .fairy: return "Fairy"
        }
    }
    
    func icon() -> Image {
        return Image("icon/symbol/\(self.text().lowercased())")
    }
}
