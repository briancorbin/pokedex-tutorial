//
//  PokemonDetails.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 12/14/24.
//

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let types: [PokemonType]
    let height: Int
    let weight: Int
    let bodyShapeId: Int
    let genus: String
}
