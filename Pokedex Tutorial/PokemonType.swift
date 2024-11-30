//
//  PokemonType.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 11/30/24.
//

import SwiftUI

enum PokemonType {
    case grass, poison
}

extension PokemonType {
    func color() -> Color {
        switch self {
        case .poison: return .poison
        case .grass: return .grass
        }
    }
    
    func text() -> String {
        switch self {
        case .poison: return "Poison"
        case .grass: return "Grass"
        }
    }
    
    func icon() -> Image {
        return Image("icon/symbol/\(self.text().lowercased())")
    }
}
