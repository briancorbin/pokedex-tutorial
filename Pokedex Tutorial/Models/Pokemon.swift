//
//  Pokemon.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 11/30/24.
//

import SwiftUI

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let types: [PokemonType]
}
