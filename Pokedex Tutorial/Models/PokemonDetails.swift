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
    let stats: [PokemonStat]
}

struct PokemonStat: Identifiable {
    let id: Int
    let baseStat: Int
    
    var name: String {
        switch id {
        case 1: return "HP"
        case 2: return "ATK"
        case 3: return "DEF"
        case 4: return "SPE"
        case 5: return "SATK"
        case 6: return "SDEF"
        default: return ""
        }
    }
}
